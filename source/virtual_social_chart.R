library(shiny)
library(plotly)
library(ggplot2)

virtual_social_chart <- tabPanel(
  
  # Creates title for this section
  title = "Socialization",
  
  # Creates select box for country and slider for year range
  sidebarLayout(
    sidebarPanel(
      radioButtons("social", label = h3("Contracted Covid"),
                   choices = list("All" = 1, "True" = 2, "False" = 3), 
                   selected = 1),
    ),
    
    # Show a box plot of the generated distribution
    mainPanel(
      plotlyOutput("vsm_box"),
      p(" "),
      p("In this chart, we decided to go with a box plot in order to discover the relationship between 
        virtual socialized minutes in a day and a persons covid status. Users are given the option to 
        select between box plots showing both people with covid and people without covid or a specific
        covid status. This allows users to see the distribution of virtual socialized minutes alongside
        specific covid statuses.")
    )
  )
)

