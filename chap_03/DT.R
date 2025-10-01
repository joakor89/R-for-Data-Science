# Data Transformation

### Loading Libraries

library(tidyverse)
library(nycflights13)

### NYCFlights13

flights

View(flights)

print(flights, width = Inf)

glimpse(flights)

### dplyr Basics

flights |>
  filter(dest == "IAH") |>
  group_by(year, month, day) |> 
  summarise(
    arr_delay = mean(arr_delay, na.rm = TRUE)
  )

