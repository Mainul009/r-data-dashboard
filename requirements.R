# requirements.R - Install all required packages
# Run this once before launching the app

pkgs <- c(
  "shiny",       # Web application framework
  "shinydashboard", # Dashboard layout components
  "ggplot2",     # Data visualisation
  "dplyr",       # Data manipulation
  "tidyr",       # Data tidying
  "readr",       # CSV file reading
  "DT",          # Interactive data tables
  "corrplot"     # Correlation matrix plots
)

# Install any missing packages
install_if_missing <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg)
    cat("Installed:", pkg, "\n")
  } else {
    cat("Already installed:", pkg, "\n")
  }
}

invisible(lapply(pkgs, install_if_missing))

cat("\nAll required packages are ready.\n")
cat("Run the app with: shiny::runApp('app/')\n")
