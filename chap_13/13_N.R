# Numbers

### Pre-requisites

library(tidyverse)
library(nycflights13)

### Making Numbers

x <- c("1.2", "5.6", "1e3")
parse_double(x)

x <- c("$1.234", "USD 3,513", "%59%")
parse_number(x)

### Counts

flights %>% count(dest)

flights %>% count(dest, sort = TRUE)

flights %>% 
  group_by(dest) %>% 
  summarize(
    n = n(),
    delay = mean(arr_delay, na.rm = TRUE)
  )

n()

flights %>% 
  group_by(dest) %>% 
  summarize(carriers = n_distinct(carrier)) %>% 
  arrange(desc(carriers))

flights %>% 
  group_by(tailnum) %>% 
  summarize(miles = sum(distance))

flights %>%  count(tailnum, wt = distance)

flights %>% 
  group_by(dest) %>% 
  summarize(n_cancelled = sum(is.na(dep_time)))

### Numeric Transformation

#### Arithmetic & Recycling Rules

x <- c(1, 2, 10, 20)

x / 5

x / c(5, 5, 5, 5)

x * c(1, 2)

x * c(1 , 2, 3)

flights %>% 
  filter(month == c(1, 2))

#### Minimum & Maximum 

df <- tribble(
  ~x, ~y,
  1, 3,
  5, 2,
  7, NA,
)

df %>% 
  mutate(
    min = pmin(x, y, na.rm = TRUE),
    max = pmax(x, y, na.rm = TRUE)
  )

df %>% 
  mutate(
    min = min(x, y, na.rm = TRUE),
    max = max(x, y, na.rm = TRUE)
  )

#### Modular A















































































