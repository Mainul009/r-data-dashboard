# R Data Dashboard

![R](https://img.shields.io/badge/R-4.0%2B-blue) ![Shiny](https://img.shields.io/badge/Shiny-1.7%2B-brightgreen) ![License](https://img.shields.io/badge/License-MIT-green) ![Status](https://img.shields.io/badge/Status-Active-brightgreen)

An interactive web dashboard built in R using Shiny for exploring, cleaning, and visualising datasets dynamically. Designed to make data storytelling intuitive and accessible without requiring front-end coding.

---

## Key Features

- **Interactive Shiny UI** with reactive inputs — filters, sliders, and dropdowns update all charts instantly
- **Exploratory Data Analysis (EDA)** — summary statistics, distributions, and correlation matrices
- **Dynamic visualisations** using ggplot2 — bar, line, scatter, histogram, and boxplot charts
- **Data cleaning and transformation** with dplyr and tidyr
- **CSV dataset support** with automated column detection and type inference
- **Modular architecture** — clean separation into `global.R`, `ui.R`, and `server.R`
- **Statistical summaries** — mean, median, standard deviation, min/max per column
- **Responsive layout** using Shiny's fluid grid system

---

## Real-Life Use Cases

| Use Case | Description |
|---|---|
| Business Analytics | Sales or operations teams explore KPI datasets interactively without writing code |
| Healthcare Research | Visualise patient data trends, treatment outcomes, or demographic distributions |
| Academic Reporting | Students and researchers present data-driven findings with dynamic visual reports |
| Public Dataset Exploration | Rapidly explore open datasets (e.g. crime stats, COVID-19, student performance) |
| Dashboard Prototyping | Quickly prototype data dashboards before building production-grade BI tools |

---

## Project Structure

```
r-data-dashboard/
├── app/
│   ├── global.R          # Global libraries and shared data loading
│   ├── ui.R              # User interface layout and input controls
│   └── server.R          # Reactive server logic and plot generation
├── analysis/
│   └── eda.R             # Standalone EDA script
├── data/
│   └── dataset.csv       # Sample dataset for testing
├── requirements.R        # R package dependencies
└── README.md
```

---

## Technologies Used

| Tool | Purpose |
|---|---|
| R 4.0+ | Core language |
| Shiny | Interactive web application framework |
| ggplot2 | Data visualisation and charting |
| dplyr | Data manipulation and filtering |
| tidyr | Data reshaping and cleaning |
| RStudio | Development environment |

---

## Installation

```r
# Install required R packages
install.packages(c("shiny", "ggplot2", "dplyr", "tidyr"))

# Or run the requirements script
source("requirements.R")
```

---

## Usage

```r
# Open RStudio and run the Shiny app
library(shiny)
runApp("app/")
```

The dashboard will open in your browser. Load any `.csv` dataset using the file upload control, then use the filters and dropdowns to explore your data interactively.

---

## Learning Goals

This project was built as part of my BSc Computing Systems studies to:
- Apply statistical analysis and EDA techniques in R
- Build interactive web applications with Shiny
- Practice data cleaning and transformation with dplyr/tidyr
- Develop professional data visualisation skills using ggplot2
- Understand reactive programming patterns in Shiny

---

## Author

**Mainul Islam Tasin**  
BSc Computing Systems Student | Ulster University  
[LinkedIn](https://www.linkedin.com/in/mainul-islam-tasin-849072361/) | [GitHub](https://github.com/Mainul009)

---

## License

MIT License — see [LICENSE](LICENSE) for details.

<!-- Updated: March 2026 -->
