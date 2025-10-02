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

### Rows

#### filter()

flights |>
  filter(dep_delay > 120)

flights |>
  filter(month == 1 & day == 1)

flights |> 
  filter(month == 1 | month == 2)

flights |>
  filter(month %in% c(1, 2))

jan1 <- flights |>
  filter(month == 1 & day == 1)

### Common Mistakes

flights |>
  filter(month = 1)

flights |>
  filter(month == 1 | 2)

#### arrange()

flights |>
  arrange(year, month, day, dep_time)

flights |>
  arrange(desc(dep_delay))



