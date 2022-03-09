library(shiny)
library(markdown)

summary_page <- tabPanel(
  "Summary",
  fluidRow(
    column(
      8, align = "center", offset = 2,
      h1("Summary Takeaways"),
      p("Looking at the relationship between COVID-19 and virtual socialized minutes in a day, we initially thought 
        that COVID-19 would heavily lessen a person's amount of time spent socializing. Yet, after looking at the 
        charts, it was revealed that even though the range of minutes spent virtually socializing for people who don't 
        have COVID-19 is larger, we found that the general distribution for the median, first, and the third quartile 
        is equivalent between both groups. Consequently, COVID-19 does not have a large enough impact to claim that it 
        affects a person's virtual social interaction."),
      br(),
      p("When it comes to the relationship between COVID-19 and sleep time, our initial assumption was that people who 
        contracted COVID-19 tend to have a lower average hours of sleep. However, upon looking at the average sleep time 
        for different age groups,  there is no apparent correlation between COVID-19 and an individual's average sleep 
        time at different ages. Therefore, we can't determine whether COVID-19 has an effect on people's sleep quality 
        or not. It is reasonable that there are no specific sleep patterns because many factors can alter an individual's 
        average sleep time. A low average sleep time isn't necessarily a consequence of COVID-19."),
      br(),
      p(""),
      br(),
      p("Mental well-being is another aspect in which COVID-19 has a negative impact on. After examining the bar chart 
        related to mental health, we found that people who contracted COVID-19 are likely to suffer from mental health 
        issues more severely. This is shown in the chart that on average, people with COVID-19 tend to show a higher 
        average level of being affected in each mental health category. This correlation suggests that people experience 
        significant mental health repercussions because of COVID-19.")
    )
  )
)
