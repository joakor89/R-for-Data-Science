# Workflow: Code Style

install.packages("styler")

library(tidyverse)
library(nycflights13)

### Names

short_flights <- flights %>% filter(air_time < 60) # strive for this

SHORTFLIGHTS <- flights %>% filter(air_time < 60) # and avoid this



















