library(shiny)
library(plotly)
library(ggplot2)
library(dplyr)

# Imports table from Covid19 dataset
COVID19_data <- read.csv("../data/COVID19_daily_survey.csv", header = TRUE, stringsAsFactors = FALSE)
COVID19_demographics <- read.csv("../data/COVID19_demographics_survey.csv", header = TRUE, stringsAsFactors = FALSE)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$vsm_box <- renderPlotly({
    # Filter columns that are of use
    COVID19_data_cleaned <- COVID19_data %>%
      select(covid_status, socialize_min)
    
    # Data Wrangling: Remove NA's from columns in use and turn 0s and 1s to true/false
    COVID19_vsm_box <- COVID19_data_cleaned %>%
      group_by(covid_status) %>%
      filter(!is.na(covid_status), !is.na(socialize_min)) %>%
      mutate(covid_status = covid_status == 1)
    
    # Selects correct chart output
    if(input$social == 2) {
      COVID19_vsm_box <- COVID19_vsm_box %>%
        filter(covid_status == TRUE)
    } else if (input$social == 3) {
      COVID19_vsm_box <- COVID19_vsm_box %>%
        filter(covid_status == FALSE)
    }
    
    # Draw the box plot with the specified country
    vsm_box_plot <- plot_ly(COVID19_vsm_box, x = ~socialize_min, y = ~covid_status, type = 'box', color = ~covid_status) %>%
      layout(title = "COVID-19 Status and Virtual Socialized Minutes", xaxis = list(title = "Virtual Socialized Minutes (Day of Survey)"), yaxis = list(title = "Contracted Covid"), hoverinfo = "x")
    
    # Returns box plot
    return(vsm_box_plot)
  })
  
  # Mental health chart
  output$mh_chart <- renderPlotly({
      COVID19_mh_data <- COVID19_data %>%
          group_by(covid_status) %>%
          filter(!is.na(covid_status)) %>%
          mutate(covid_status = covid_status == 1) %>%
          summarize(Stress = mean(stress, na.rm = TRUE),
                    Isolation = mean(isolation, na.rm = TRUE),
                    Depression = mean(depression1, na.rm = TRUE),
                    WorryHealth = mean(worry_health, na.rm = TRUE),
                    WorryFinances = mean(worry_finances, na.rm = TRUE),
                    Tiredness = mean(depression4, na.rm = TRUE),
                    DifficultyConcentrating = mean(depression7, na.rm = TRUE))
      
      mh_chart <- plot_ly(
          data = COVID19_mh_data,
          x = input$mental,
          y = ~.data[[input$mental]],
          color = ~covid_status,
          type = "bar"
      ) %>%
          layout(
              title = "Mental Health Severity Level",
              yaxis = list(title = "Scale Level")
          )
      # Return the visualization
      mh_chart
  })
  
  # Physical exercise scatter plot 
  output$exercise_scatter_plot <- renderPlotly({
    COVID19_exercise_data <- COVID19_data %>%
      group_by(covid_status) %>%
      filter(!is.na(covid_status)) %>%
      mutate(covid_status = covid_status == 1) %>%
      select(steps)

    # Draw the scatter plot 
    exercise_scatter_plot <- plot_ly(COVID19_exercise_data,
                                 x = ~steps,
                                 y = ~covid_status,
                                 type = 'scatter') %>%
      layout(title = "COVID-19 Status and daily steps",
             xaxis = list(title = "Total steps taken"),
             yaxis = list(title = "COVID-19 Status"))
    
    # Returns scatter plot
    return(exercise_scatter_plot)
  })
  
  # Sleep Quality chart (grouped by ages)
  output$sq_chart <- renderPlotly({
    
    COVID19_age_data <- COVID19_data %>%
      select(sub_id, age1)
    
    mh_chart <- plot_ly(
      data = COVID19_mh_data,
      x = input$mental,
      y = ~.data[[input$mental]],
      color = ~covid_status,
      type = "bar"
    ) %>%
      layout(
        title = "Mental Health Severity Level",
        yaxis = list(title = "Scale Level")
      )
    # Return the visualization
    mh_chart
  })
}

