# Workflow: Scripts & Projects

### Running Code

library(dplyr)

library(nycflights13)

not_cancelled <- flights %>% 
  group_by(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarize(mean = mean(dep_delay))


### Where Does Your Analysis Live?

getwd()

### RStudio Projects

library(tidyverse)

