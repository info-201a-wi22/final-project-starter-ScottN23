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
  virtual_social_chart,
  mental_health_chart
)