# Missing Values

#### Pre-requisites
library(tidyverse)

### Explicit Missing Values

treatment <- tribble(
  ~person,            ~treatment, ~response,
  "Derrick Whitmore", 1,          7,
  NA,                 2,          10,
  NA,                 3,          NA,
  "Katherine Burke",  1,          4
)

treatment %>% 
  fill(everything())


#### Fixed Values

x <- c(1, 4, 5, 7, NA)
coalesce(x, 0)

x <- c(1, 4, 5, 7, -99)
na_if(x, -99)

#### NaN

x <- c(NA, NaN)

x * 10

x == 1

is.na(x)

0 / 0

0 * Inf

Inf - Inf

sqrt(-1)

### Implicit Missing Values

stocks <- tibble(
  year = c(2020, 2020, 2020, 2020, 2021, 2021, 2021),
  qtr = c(   1,    2,     3,    4,   2,    3,    4),
  price = c(1.88, 0.59, 0.35, NA, 0.92, 0.17, 2.66)
)

#### Pivoting




























































































