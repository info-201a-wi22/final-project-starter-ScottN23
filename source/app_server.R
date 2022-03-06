#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(ggplot2)
library(dplyr)

# Imports table from Covid19 dataset
COVID19_data <- read.csv("../data/COVID19_daily_survey.csv", header = TRUE, stringsAsFactors = FALSE)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$boxPlot <- renderPlotly({
    
    # Generate bins based on input$bins from ui.R
    output$value <- renderPrint({ input$checkbox })
    
    # Filter columns that are of use
    COVID19_data_cleaned <- COVID19_data %>%
      select(covid_status, socialize_min)
    
    # Data Wrangling: Remove NA's from columns in use and turn 0s and 1s to true/false
    COVID19_data_cleaned <- COVID19_data_cleaned %>%
      group_by(covid_status) %>%
      filter(!is.na(covid_status), !is.na(socialize_min)) %>%
      mutate(covid_status = covid_status == 1) %>%
      filter(covid_status == input$checkbox)
    
    # Draw the box plot with the specified country
    covid_socialize <- plot_ly(COVID19_data_cleaned, x = ~socialize_min, y = ~covid_status, type = 'box')
    
    # Returns box plot
    return(covid_socialize)
  })
  
}
