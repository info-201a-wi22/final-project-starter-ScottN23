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
         p("In this chart we decided to go with a side by side bar graph in order to discover the impacts of COVID-19 on varying categories of mental health on individuals. Users are given the option to select between different mental health categories, allowing users to see the impacts of COVID-19 on a particular aspect of a person's mental health on a scale of 0 (not affected at all) to 5 (heavily affected).")
      )
   )
)