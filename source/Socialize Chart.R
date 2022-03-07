library(shiny)
library(plotly)
library(ggplot2)

virtual_social_chart <- tabPanel(
  
  # Creates title for this section
  title = "Socialization",
  
  # Creates select box for country and slider for year range
  sidebarLayout(
    sidebarPanel(
      radioButtons("radio", label = h3("Contracted Covid"),
                   choices = list("All" = 1, "True" = 2, "False" = 3), 
                   selected = 1),
    ),
    
    # Show a box plot of the generated distribution
    mainPanel(
      plotlyOutput("boxPlot"),
      p("")
    )
  )
)

