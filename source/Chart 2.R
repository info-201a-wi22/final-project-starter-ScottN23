library(tidyverse)
library(plotly)

COVID19_data <- read.csv("../data/COVID19_daily_survey.csv", header = TRUE, stringsAsFactors = FALSE)


#Select columns we need to answer our driving questions
COVID19_data_cleaned <- COVID19_data %>%
   select(unique_id, covid_status, TST, sleepdiary_fellasleep, sleepdiary_wakes)

#Data analysis: correlation between COVID-19 and quality of sleep (indicated by total sleep time)
COVID19_sleep_quality <- COVID19_data_cleaned %>%
   drop_na() %>%
   filter(is.na(covid_status) == FALSE, is.na(sleepdiary_fellasleep) == FALSE) %>%
   group_by(covid_status) %>%
   mutate(contracted_covid = covid_status == 1) %>%
   mutate(avg_TST = mean(TST, na.rm = TRUE)) 

#Data Visualization
# COVID_TST_visualization <- ggplot(COVID19_sleep_quality) +
#   geom_col(mapping = aes(x = avg_TST, y = covid_status, group = covid_status, fill = covid_status)) +
#   scale_x_continuous(limits=c(0, 8)) +
#   labs(x = "Average Sleep Time", y = "COVID Status", title = "COVID-19 Impact on Sleep Time") 

COVID_TST_visualization <- ggplot(COVID19_sleep_quality) +
   geom_point(mapping = aes(x = TST, y = sleepdiary_fellasleep, color = contracted_covid)) +
   facet_wrap(~contracted_covid) +
   labs(x = "Average Sleep Time", y = "Difficulty of Sleep", title = "COVID-19 Impact on Sleep Quality")

ggplotly(COVID_TST_visualization)

