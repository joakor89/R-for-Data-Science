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

stocks %>% 
  pivot_wider(
    names_from = qtr,
    values_from = price
  )

#### Complete

stocks %>% 
  complete(year, qtr)

stocks %>% 
  complete(year = 2019:2021, qtr)

#### Joins

library(nycflights13)

flights %>% 
  distinct(faa = dest) %>% 
  anti_join(airports)

flights %>% 
  distinct(tailnum) %>% 
  anti_join(planes)

### Factors & Empty Groups

health <- tibble(
  name = c("Ikaia", "Oletta", "Leriah", "Dashay", "Tresaun"),
  smoker = factor(c("no", "no", "no", "no", "no"), levels = c("yes", "no")),
  age = c(34, 88, 75, 47, 56)
)

health %>% count(smoker)

health %>% count(smoker, .drop = FALSE)

ggplot(health, aes(x = smoker)) +
  geom_bar() +
  scale_x_discrete()

ggplot(health, aes(x = smoker)) +
  geom_bar() +
  scale_x_discrete(drop = FALSE)

health %>% 
  group_by(smoker, .drop = FALSE) %>% 
  summarize(
    n = n(),
    mean_age = mean(age, na.rm = TRUE),
    min_age = min(age, na.rm = TRUE),
    max_age = max(age, na.rm = TRUE),
    sd_age = sd(age, na.rm = TRUE)
  )

x1 <- c(NA, NA)
length(x1)

x2 <- numeric()
length(x2)

health %>% 
  group_by(smoker) %>% 
  summarize(
    n = n(),
    mean_age = mean(age, na.rm = TRUE),
    min_age = min(age, na.rm = TRUE),
    max_age = max(age, na.rm = TRUE),
    sd_age = sd(age, na.rm = TRUE)
  ) %>% 
  complete(smoker)










































































