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
         p(" ")
      )
   )
)