# server.R - Server logic for R Data Dashboard

server <- function(input, output, session) {

  # ---- Reactive: filtered data ----
  filtered_df <- reactive({
    data <- df
    if (!is.null(input$num_filter) && length(num_cols()) > 0) {
      col <- num_cols()[1]
      data <- data[data[[col]] >= input$num_filter[1] & data[[col]] <= input$num_filter[2], ]
    }
    data
  })

  # ---- Helper: numeric and character columns ----
  num_cols <- reactive(names(df)[sapply(df, is.numeric)])
  cat_cols <- reactive(names(df)[sapply(df, is.character)])

  # ---- Dynamic UI ----
  output$x_var_ui <- renderUI({
    selectInput("x_var", "X Axis Variable", choices = names(df), selected = names(df)[1])
  })

  output$y_var_ui <- renderUI({
    selectInput("y_var", "Y Axis Variable", choices = num_cols(), selected = num_cols()[1])
  })

  output$num_filter_ui <- renderUI({
    req(length(num_cols()) > 0)
    col <- num_cols()[1]
    sliderInput("num_filter", paste("Filter by", col),
      min = floor(min(df[[col]], na.rm = TRUE)),
      max = ceiling(max(df[[col]], na.rm = TRUE)),
      value = c(floor(min(df[[col]], na.rm = TRUE)), ceiling(max(df[[col]], na.rm = TRUE)))
    )
  })

  # Reset filters
  observeEvent(input$reset_btn, {
    updateSelectInput(session, "x_var", selected = names(df)[1])
    updateSelectInput(session, "y_var", selected = num_cols()[1])
  })

  # ---- Tab 1: Overview ----
  output$total_rows <- renderValueBox({
    valueBox(nrow(filtered_df()), "Total Rows", icon = icon("list"), color = "blue")
  })

  output$total_cols <- renderValueBox({
    valueBox(ncol(df), "Total Columns", icon = icon("columns"), color = "green")
  })

  output$missing_vals <- renderValueBox({
    missing <- sum(is.na(filtered_df()))
    valueBox(missing, "Missing Values", icon = icon("exclamation-triangle"), color = if (missing > 0) "red" else "green")
  })

  output$data_preview <- renderTable({
    head(filtered_df(), 10)
  })

  # ---- Tab 2: Visualisations ----
  output$bar_chart <- renderPlot({
    req(input$x_var)
    ggplot(filtered_df(), aes_string(x = input$x_var)) +
      geom_bar(fill = "steelblue") +
      labs(title = paste("Bar Chart:", input$x_var), x = input$x_var, y = "Count") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })

  output$histogram <- renderPlot({
    req(input$y_var, length(num_cols()) > 0)
    ggplot(filtered_df(), aes_string(x = input$y_var)) +
      geom_histogram(fill = "coral", bins = 20, colour = "white") +
      labs(title = paste("Histogram:", input$y_var), x = input$y_var, y = "Frequency") +
      theme_minimal()
  })

  output$scatter_plot <- renderPlot({
    req(input$x_var, input$y_var, length(num_cols()) > 0)
    ggplot(filtered_df(), aes_string(x = input$x_var, y = input$y_var)) +
      geom_point(colour = "purple", alpha = 0.6, size = 2) +
      geom_smooth(method = "lm", se = TRUE, colour = "darkblue") +
      labs(title = paste("Scatter:", input$x_var, "vs", input$y_var)) +
      theme_minimal()
  })

  # ---- Tab 3: Data Table ----
  output$full_table <- DT::renderDataTable({
    DT::datatable(filtered_df(), options = list(pageLength = 15, scrollX = TRUE))
  })

  # ---- Tab 4: EDA ----
  output$summary_stats <- renderPrint({
    summary(filtered_df())
  })

  output$corr_plot <- renderPlot({
    num_data <- filtered_df()[, num_cols(), drop = FALSE]
    req(ncol(num_data) >= 2)
    corr_matrix <- cor(num_data, use = "complete.obs")
    corrplot::corrplot(corr_matrix, method = "color", type = "upper",
      tl.col = "black", tl.srt = 45, addCoef.col = "black", number.cex = 0.8)
  })
}
