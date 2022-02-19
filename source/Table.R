library(tidyverse)

COVID19_data <- read.csv("../data/COVID19_daily_survey.csv", header = TRUE, stringsAsFactors = FALSE)

useful_data <- COVID19_data %>% 
  select(unique_id, covid_status, TST, sleepdiary_fellasleep, socialize_min, exercise, stress, isolation, worry_scale) %>%
  group_by(covid_status) %>%
  mutate(covid_status = covid_status == 1, exercise = exercise == 1) %>%
  filter(!is.na(covid_status), !is.na(socialize_min)) %>% 
  rename(total_sleep_time = TST, difficulty_falling_asleep = sleepdiary_fellasleep, virtually_socialized_min = socialize_min) %>%
  mutate(total_sleep_time = round(total_sleep_time, digits = 1))

table <- useful_data
View(table)
