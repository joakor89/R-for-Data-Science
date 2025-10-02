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

#### distinct()

flights |>
  distinct()

flights |>
  distinct(origin, dest)

flights |> 
  distinct(origin, dest, .keep_all = TRUE)

flights |> 
  count(origin, dest, sort = TRUE)

### Columns

#### mutate()

flights |>
  mutate(
    gain = dep_delay - arr_delay,
    speed = distance / air_time * 60
  )

flights |>
  mutate(
    gain = dep_time - arr_delay,
    speed = distance / air_time * 60,
    .before = 1
  )

flights |>
  mutate(
    gain = dep_time - arr_delay,
    speed = distance / air_time * 60,
    .after = day
  )


flights |>
  mutate(
    gain = dep_time - arr_delay,
    hours = air_time / 60,
    gain_per_hour = gain / hours,
    .keep = "used"
  )

#### select()
flights |>
  select(year, month, day)

flights |>
  select(year:day)

flights |>
  select(!year:day)

flights |>
  select(where(is.character))

?select

flights |>
  select(tail_num = tailnum)

#### rename()

flights |>
  rename(tail_num = tailnum)

#### relocate()

flights |>
  relocate(time_hour, air_time)

flights |>
  relocate(year:dep_time, .after = time_hour)
flights |>
  relocate(starts_with("arr"), .before = dep_time)

### The Pipe

flights |>
  filter(dest == "IAH") |>
  mutate(speed = distance / air_time * 60) |>
  select(year:day, dep_time, carrier, flight, speed) |>
  arrange(desc(speed))

arrange(
  select(
    mutate(
      filter(
        flights,
        dest == "AIH"
      ),
      speed = distance / air_time * 60
    ),
    year:day, dep_time, carrier, flight, speed
  ),
  desc(speed)
)

flights1 <- filter(flights, dest == "AIH")
flights2 <- mutate(flights1, speed = distance / air_time * 60)
flights3 <- select(flights2, year:day, dep_time, carrier, flight, speed)
arrange(flights3, desc(speed))

##### magrittr
library(tidyverse)

mtcars %>%
  group_by() %>%
  summarize(n =n())

### Groups

#### group_by()
flights %>% 
  group_by(month)

#### summarize()
flights %>% 
  group_by(month) %>% 
  summarize(
    avg_delay = mean(dep_delay)
  )

flights %>% 
  group_by(month) %>% 
  summarize(
    delay = mean(dep_delay, na.rm = TRUE)
  )

flights %>% 
  group_by(month) %>%
  summarize(
    delay = mean(dep_delay, na.rm = TRUE),
    n = n()
  )

#### The slice_Functions

flights %>% 
  group_by(dest) %>% 
  slice_max(arr_delay, n = 1) %>% 
  relocate(dest)

#### Grouping by Multiple Variables

daily <- flights %>% 
  group_by(year, month, day) 

daily

daily_flights <- flights %>% 
  summarize(n = n())

daily_flights

#### Ungrouping

daily %>% 
  ungroup()

daily %>% 
  ungroup() %>% 
  summarize(
    avg_delay = mean(dep_delay, na.rm = TRUE),
    flights = n()
  )

#### .by
flights %>% 
  summarize(
    delay = mean(dep_delay, na.rm = TRUE),
    n = n(),
    .by = month
  )

flights %>% 
  summarize(
    delay = mean(dep_delay, na.rm = TRUE),
    n = n(),
    .by = c(origin, dest)
  )

