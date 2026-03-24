# eda.R - Standalone Exploratory Data Analysis script
# Run this independently in RStudio for offline analysis

library(ggplot2)
library(dplyr)
library(tidyr)
library(readr)
library(corrplot)

# ---- Load Data ----
df <- read_csv("../data/dataset.csv")
names(df) <- tolower(gsub(" ", "_", names(df)))

cat("Dataset loaded:\n")
cat("Rows:", nrow(df), "| Columns:", ncol(df), "\n\n")

# ---- Summary Statistics ----
cat("=== Summary Statistics ===\n")
print(summary(df))

# ---- Missing Values ----
cat("\n=== Missing Values per Column ===\n")
print(colSums(is.na(df)))

# ---- Numeric columns ----
num_cols <- names(df)[sapply(df, is.numeric)]
cat_cols <- names(df)[sapply(df, is.character)]

# ---- Histograms for numeric columns ----
if (length(num_cols) > 0) {
  for (col in num_cols) {
    p <- ggplot(df, aes_string(x = col)) +
      geom_histogram(fill = "steelblue", bins = 20, colour = "white") +
      labs(title = paste("Distribution of", col), x = col, y = "Count") +
      theme_minimal()
    print(p)
  }
}

# ---- Bar charts for categorical columns ----
if (length(cat_cols) > 0) {
  for (col in cat_cols[1:min(3, length(cat_cols))]) {
    p <- df %>%
      count(!!sym(col)) %>%
      ggplot(aes_string(x = col, y = "n")) +
      geom_col(fill = "coral") +
      labs(title = paste("Frequency of", col), x = col, y = "Count") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    print(p)
  }
}

# ---- Correlation Matrix ----
if (length(num_cols) >= 2) {
  cat("\n=== Correlation Matrix ===\n")
  corr_matrix <- cor(df[, num_cols], use = "complete.obs")
  print(round(corr_matrix, 2))

  corrplot(corr_matrix, method = "color", type = "upper",
    tl.col = "black", tl.srt = 45,
    addCoef.col = "black", number.cex = 0.8,
    title = "Correlation Matrix", mar = c(0,0,2,0))
}

cat("\nEDA complete.\n")
