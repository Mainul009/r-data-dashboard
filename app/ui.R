# ui.R - User Interface for R Data Dashboard

ui <- fluidPage(

  # App styling
  tags$head(
    tags$link(rel = "stylesheet", href = "styles.css")
  ),

  # Title
  titlePanel(app_title),

  # Sidebar layout
  sidebarLayout(

    # Sidebar panel with filters
    sidebarPanel(
      width = 3,

      h4("Filters"),
      hr(),

      # Dynamic column selector for X axis
      uiOutput("x_var_ui"),

      # Dynamic column selector for Y axis
      uiOutput("y_var_ui"),

      # Numeric filter slider (if numeric column exists)
      uiOutput("num_filter_ui"),

      hr(),
      actionButton("reset_btn", "Reset Filters", class = "btn-warning btn-sm")
    ),

    # Main panel with tabs
    mainPanel(
      width = 9,

      tabsetPanel(
        id = "main_tabs",

        # Tab 1: Overview
        tabPanel(
          title = "Overview",
          icon = icon("chart-bar"),
          br(),
          fluidRow(
            valueBoxOutput("total_rows", width = 4),
            valueBoxOutput("total_cols", width = 4),
            valueBoxOutput("missing_vals", width = 4)
          ),
          br(),
          h4("Dataset Preview"),
          tableOutput("data_preview")
        ),

        # Tab 2: Visualisations
        tabPanel(
          title = "Visualisations",
          icon = icon("chart-line"),
          br(),
          fluidRow(
            column(6, plotOutput("bar_chart", height = "350px")),
            column(6, plotOutput("histogram", height = "350px"))
          ),
          br(),
          fluidRow(
            column(12, plotOutput("scatter_plot", height = "350px"))
          )
        ),

        # Tab 3: Data Table
        tabPanel(
          title = "Data Table",
          icon = icon("table"),
          br(),
          DT::dataTableOutput("full_table")
        ),

        # Tab 4: EDA
        tabPanel(
          title = "EDA",
          icon = icon("microscope"),
          br(),
          h4("Summary Statistics"),
          verbatimTextOutput("summary_stats"),
          br(),
          h4("Correlation Matrix"),
          plotOutput("corr_plot", height = "400px")
        )
      )
    )
  )
)
