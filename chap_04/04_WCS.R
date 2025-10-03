# Workflow: Code Style

install.packages("styler")

library(tidyverse)
library(nycflights13)

### Names

short_flights <- flights %>% filter(air_time < 60) # strive for this

SHORTFLIGHTS <- flights %>% filter(air_time < 60) # and avoid this

### Spaces

z <- (a + b)^2 /d # strive for this

z<-(a+b) ^ 2/d # and avoid this

mean(x, na.rm = TRUE) # strive for this

mean (x ,na.rm=TRUE) # and avoid this

flights %>% 
  mutate(
    speed      = distance / air_time,
    dep_hour   = dep_time %>% 100,
    dep_minute = dep_time %>% 100
  )

### Pipes

flights %>% 
  filter(!is.na(arr_delay), !is.na(tailnum)) %>% 
  count(dest) # strive for this

flights %>% filter(!is.na(arr_delay), !is.na(tailnum)) %>% count(dest) # and avoid this

flights %>% 
  group_by(tailnum) %>% 
  summarize(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  ) # strive for this

flights %>% 
  group_by(
    tailnum
  ) %>% 
  summarize(delay = mean(arr_delay, na.rm = TRUE), n = n()) # and avoid this

flights %>% 
  group_by(tailnum) %>% 
  summarize(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  ) # strive for this

flights %>% 
  group_by(tailnum) %>% 
  summarize(
              delay = mean(arr_delay, na.rm = TRUE),
              n = n()
            ) # and avoid this

flights %>% 
  group_by(tailnum) %>% 
  summarize(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  )

### 







