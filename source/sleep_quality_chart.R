library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)

COVID19_data <- read.csv("../data/COVID19_daily_survey.csv", header = TRUE, stringsAsFactors = FALSE)
COVID19_demographics <- read.csv("../data/COVID19_demographics_survey.csv", header = TRUE, stringsAsFactors = FALSE)



## Widget
covid_input <- radioButtons(
   "covid",
   label = "Contracted Covid",
   choices = list("Negative" = 1, "Positive" = 2, "Both" = 3), 
   selected = 1)

age_input <- radioButtons(
   inputId = "age", 
   label = "Age groups", 
   choices = list("18 - 24" = 1, "25 - 64" = 2, "65 and over" = 3)
)



## Visualization page
sleep_quality_chart <- tabPanel(
   "Sleep Quality",
   sidebarLayout(
      sidebarPanel(
         covid_input,
         age_input
      ),
      mainPanel(
         plotlyOutput("sq_chart"),
         p(" ")
      )
   )
)