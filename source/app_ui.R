library(shiny)
library(shinyWidgets)
source("virtual_social_chart.R")
source("mental_health_chart.R")
source("sleep_quality_chart.R")
source("physical_exercise_chart.R")
source("summary_takeaways.R")

# Creates UI for Web App
ui <- navbarPage(
  title = "Can't Sleep Through The Pandemic",
  tabPanel("Introduction",
           setBackgroundColor(
             color = "PowderBlue",
             gradient = c("linear", "radial"),
             direction = c("bottom", "top", "right", "left"),
             shinydashboard = FALSE
           ),
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
                    strong("Amidst that many social injustices that have created trauma and affected different lives of folks; contemporarily, a pandemic, the Coronavirus or COVID-19, 
                           has also played a role in impacting the lives and wellbeing of families from all around the world. COVID-19 has definitely taken a toll on the economy, 
                           wellbeing, and different aspects of human development. However, with this being a global issue affecting human lives, we can correlate its adverse effects 
                           on humans. That means through a lens of data science, there has been the potential of COVID statistically increasing or declining the quality of life of 
                           different individuals. While hearing and learning more about the symptoms of the Coronavirus: fevers or chills, cough, fatigue, sore throat, the new loss 
                           of taste or smell, etc. Although it can be seen that many of these symptoms remain on the more physical side, the pandemic as a whole seemingly has also 
                           affected the individual's experiences and communications with one another. In turn, the Coronavirus has its effects on the mental and wellbeing of an 
                           individual as well. Different laws within each country were imposed such as the mask mandate, social distancing, travel bans, and much more which resulted 
                           in limited interactions. As a repercussion of these limiting forces, it takes causes negative effects to different families being unable to see each other 
                           during pivotal moments within their lives, young children are not able to have in-person classes, or they may be limited opportunities because of the fear 
                           of contracting COVID-19. This quarter, our group was dedicated to finding the influence of COVID-19 on an individual's social and mental health. We were 
                           inclined in creating more accessible data to understand how the pandemic was either negatively or positively affecting aspects of lives. Here, we researched 
                           dataset from Boston College daily sleep and well-being survey data during the early phase of the COVID-19 pandemic, which was compiled by Tony Cunningham, 
                           Eric Fields, and Elizabeth Kensinger from Boston College. From our findings, we found data that potentially connected COVID-19 to different mental health"),
             ),
           ),
        ),
  virtual_social_chart,
  sleep_quality_chart,
  physical_exercise_chart,
  mental_health_chart,
  summary_page
)
