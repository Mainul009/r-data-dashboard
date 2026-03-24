# R Data Dashboard

An interactive R Shiny dashboard for data analysis and visualisation of public datasets.

## Features

- Interactive dashboard built with **R Shiny**
- Data cleaning and manipulation using **dplyr** and **tidyr**
- Beautiful visualisations using **ggplot2**
- Summary statistics and exploratory data analysis (EDA)
- Filterable and reactive UI components
- Works with public datasets (e.g. crime stats, student performance, COVID-19 data)

## Technologies Used

| Tool | Purpose |
|------|---------|
| R | Core language |
| Shiny | Interactive web dashboard |
| ggplot2 | Data visualisation |
| dplyr | Data manipulation |
| tidyr | Data tidying |
| readr | CSV/data import |
| RStudio | Development environment |

## Project Structure

```
r-data-dashboard/
├── app/
│   ├── ui.R             # User interface layout
│   ├── server.R         # Server logic and reactivity
│   └── global.R         # Shared variables and libraries
├── data/
│   └── dataset.csv      # Sample public dataset
├── analysis/
│   └── eda.R            # Exploratory data analysis script
├── www/
│   └── styles.css       # Custom styling
├── README.md
└── requirements.R       # Required packages
```

## Getting Started

### Prerequisites

- R 4.0+
- RStudio
- Required packages (install via `requirements.R`)

### Installation

```r
# Clone the repo
git clone https://github.com/Mainul009/r-data-dashboard.git

# Install required packages
source("requirements.R")

# Run the Shiny app
shiny::runApp("app/")
```

## Dashboard Panels

1. **Overview** — Summary stats and key metrics
2. **Visualisations** — Bar charts, histograms, scatter plots
3. **Data Table** — Interactive, filterable dataset
4. **EDA** — Correlation and distribution analysis

## Learning Goals

This project reinforces:
- Data analysis and statistics using R
- RStudio workflow and project organisation
- Building reactive web applications with Shiny
- Data visualisation best practices with ggplot2
- Working with real-world public datasets

## Author

**Mainul Islam Tasin** — BSc Computing Systems, Ulster University

## License

MIT License
