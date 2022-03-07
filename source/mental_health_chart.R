library(shiny)
library(ggplot2)
library(plotly)

# Imports table from Covid19 dataset
COVID19_data <- read.csv("../data/COVID19_daily_survey.csv", header = TRUE, stringsAsFactors = FALSE)

# Widget
mental_health_input <- selectInput(
   inputId = "mental", 
   label = "Mental Health", 
   choices = c("Stress", "Isolation", "Depression", "WorryHealth", "WorryFinances")
)



# Visualization page
mental_health_chart <- tabPanel(
   "Mental Health",
   sidebarLayout(
      sidebarPanel(
         mental_health_input
      ),
      mainPanel(
         plotlyOutput("mh_chart"),
         p(" ")
      )
   )
)