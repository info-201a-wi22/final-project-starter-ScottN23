#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
source("virtual_social_chart.R")
source("mental_health_chart.R")
source("sleep_quality_chart.R")

ui <- navbarPage(
  
  title = "Can't Sleep Through The Pandemic",
  tabPanel("Introduction",
           fluidRow(
             column(4,
                    img(src = "https://media.giphy.com/media/kaIJGG8lNC3u5DM3tg/giphy.gif"),
                    ),
             
             column(4,
                    img(src = "https://media.giphy.com/media/Zm17XBTlVfjacXg44z/giphy.gif"),
                    ),
           ),
           fluidRow(
             column(8,
                    h1("Introduction to Project:"),
                    strong("Contemporarily, a pandemic, the Coronavirus or COVID-19, has affected the lives and wellbeing of families from all around the world. 
                    This quarter, our group was dedicated on finding the influence of COVID-19 on indivudals. Here, we researched dataset from 
                    Boston College daily sleep and well-being survey data during early phase of the COVID-19 pandemic, which was compiled by 
                    Tony Cunningham, Eric Fields, and Elizabeth Kensinger from Boston College. From our findings, we found data that connected COVID-19 
                    to different mental health problems such as stress levels or different attributes of physical health being affected like sleep quality."),
             ),
           ),
  ),
  virtual_social_chart,
  mental_health_chart,
  sleep_quality_chart
)