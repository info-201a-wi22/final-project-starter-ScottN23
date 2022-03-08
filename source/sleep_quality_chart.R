library(shiny)
library(ggplot2)
library(plotly)


# Widget
covid_input <- radioButtons(
   "covid",
   label = "Contracted Covid",
   choices = list("Negative" = 1, "Positive" = 2, "Both" = 3), 
   selected = 1)

age_input <- radioButtons(
   inputId = "age", 
   label = "Age groups", 
   choices = list("18 - 24" = 1, "25 - 64" = 2, "65 and over" = 3),
   selected = 1
)



# Visualization page
sleep_quality_chart <- tabPanel(
   "Sleep Quality",
   sidebarLayout(
      sidebarPanel(
         age_input
      ),
      mainPanel(
         plotlyOutput("sq_chart"),
         p(" "),
         p("In this chart, we decided to go with a side by side bar graph representing a group of negative
           and positive individuals with COVID-19 alongside options for age groups in order to discover the
           impacts of COVID-19 on a specific age group's length of sleep. We wanted to see if COVID-19 
           affected a person's sleep and decided that having specific age ranges takes away another variable
           that may effect our understanding of the impacts of COVID-19. As a result, we are provided the 
           options to select between three different age groups: 18-24, 25-64, and 65 and over, revealing 
           the age group's average sleep time at specific ages.")
      )
   )
)

