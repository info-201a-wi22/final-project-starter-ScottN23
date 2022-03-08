library(shiny)
library(ggplot2)
library(plotly)


## Widget
covid_input <- radioButtons(
   inputID = "covid",
   label = "Contracted Covid",
   choices = list("Negative" = 1, "Positive" = 2, "Both" = 3), 
   selected = 1)

age_input <- selectInput(
   inputId = "age", 
   label = "Age groups", 
   choices = c("18 - 24", "25 - 64", "65 and over")
)



## Visualization page
mental_health_chart <- tabPanel(
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

