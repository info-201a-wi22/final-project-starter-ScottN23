library(shiny)
library(plotly)
library(ggplot2)

virtual_social_chart <- tabPanel(
  
  title = "Socialization",
  
  # Creates select box for country and slider for year range
  sidebarLayout(
    sidebarPanel(
      checkboxInput("checkbox", label = "Contracted Covid", value = TRUE),
    ),
    
    # Show a box plot of the generated distribution
    mainPanel(
      plotlyOutput("boxPlot"),
      p("")
    )
  )
)

