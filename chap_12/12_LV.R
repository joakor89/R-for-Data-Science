# Logical Vector

### Pre-Requisites

library(tidyverse)
library(nycflights13)

x <- c(1, 2, 3, 5, 7, 11, 13)

x * 2

df <- tibble(x)

df %>% 
  mutate(y = x * 2)

# Comparisons

flights %>% 
  filter(dep_time > 600 & dep_time < 2000 & abs(arr_delay) < 20)

flights %>% 
  mutate(
    daytime = dep_time > 600 & dep_time < 2000,
    approx_time = abs(arr_delay) < 20,
    .keep = "used"
  )

flights %>% 
  mutate(
    daytime = dep_time > 600 & dep_time < 2000,
    approx_ontime = abs(arr_delay) < 20,
  ) %>% 
  filter(daytime & approx_ontime)

#### Floating-Point Comparison

x <- c(1 / 49 * 49, sqrt(2) ^2)

x

x == c(1, 2)

print(x, digits = 16)

near(x, c(1, 2))


























































































