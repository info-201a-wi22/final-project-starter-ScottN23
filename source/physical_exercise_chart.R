library(shiny)
library(plotly)
library(ggplot2)

physical_exercise_chart <- tabPanel(
  
  # Title for this page
  title = "Physical exercise",
  
  # Creates select box for country and slider for year range
  sidebarLayout(
    sidebarPanel(
      radioButtons("steps", label = h3("Covid status"),
                   choices = list("Covid positive" = 1, "Covid negative" = 0), 
                   selected = 1),
    ),
    
    # Show a scatter plot of the generated distribution
    mainPanel(
      plotlyOutput("exercise_scatter_plot"),
      p("")
    )
  )
)