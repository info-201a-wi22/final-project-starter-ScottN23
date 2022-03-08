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
         p(" "),
         p("In this chart, we decided to go with a side by side bar graph in order to discover the impacts of
           COVID-19 on the average of responses to varying categories of mental health. Users are given the option 
           to select between different mental health categories, allowing users to see the impacts of COVID-19 on
           the average of particular aspect of mental health on a scale of 0 (not affected at all) to 5 (heavily
           affected).")
      )
   )
)