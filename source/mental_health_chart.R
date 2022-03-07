library(shiny)
library(ggplot2)
library(plotly)


# Widget
mental_health_input <- selectInput(
   inputId = "mental", 
   label = "Mental Health", 
   choices = c("Stress", "Isolation", "Depression", "WorryHealth", "WorryFinances", "Tiredness", "DifficultyConcentrating")
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