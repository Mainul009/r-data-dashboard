# global.R - Shared libraries and data loaded once at startup

library(shiny)
library(ggplot2)
library(dplyr)
library(tidyr)
library(readr)

# Load dataset
df <- read_csv("../data/dataset.csv")

# Clean column names
names(df) <- tolower(gsub(" ", "_", names(df)))

# App title
app_title <- "R Data Dashboard"
