library(shiny)
library(ggplot2)
library(plotly)

COVID19_data <- read.csv("../data/COVID19_daily_survey.csv", header = TRUE, stringsAsFactors = FALSE)


## Widget
sleep_input <- selectInput(
   inputId = "sleep_quality", 
   label = "Sleep", 
   choices = c("Total Sleep Time", )
)



## Visualization page
mental_health_chart <- tabPanel(
   "Sleep Quality",
   sidebarLayout(
      sidebarPanel(
         sleep_input
      ),
      mainPanel(
         plotlyOutput("sq_chart"),
         p(" ")
      )
   )
)