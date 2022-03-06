library(shiny)
library(ggplot2)
library(plotly)

COVID19_data <- read.csv("../data/COVID19_daily_survey.csv", header = TRUE, stringsAsFactors = FALSE)


## Widget
mental_health_input <- checkboxGroupInput(
   inputId = "mental", 
   label = "Mental Health", 
   choices =  choices = list("Stress" = 1, "Isolation" = 2, "Depression" = 3, "Health Worry" = 4, "Finance Worry" = 5)
)



## Visualization page
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