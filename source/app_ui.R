#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
source("Socialize Chart.R")
source("mental_health_chart.R")

ui <- navbarPage(
  
  title = "Can't Sleep Through The Pandemic",
  tabPanel("Introduction to Can't Sleep Through The Pandemic",
           fluidRow(
             column(3,
                    img(src = "https://media.giphy.com/media/kaIJGG8lNC3u5DM3tg/giphy.gif"),
                    ),
             column(3,
                    img(src = "https://media.giphy.com/media/Zm17XBTlVfjacXg44z/giphy.gif"),
                    ),
             column(6,
                    h1("Introduction to Project:"),
                    strong("Contemporarily...,"),
                    ),
           ),
  ),
  virtual_social_chart,
  mental_health_chart
)