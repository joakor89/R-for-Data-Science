# Exploratory Data Analysis

### Prerequisites

library(tidyverse)

### Variation 

ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.5)

### Typical Values

smaller <- diamonds %>% 
  filter(carat < 3)

ggplot(smaller, aes(x = carat)) +
  geom_histogram(binwidth = 0.01)

### Unusual Values

ggplot(diamonds, aes(x = y)) +
  geom_histogram(binwidth = 0.5)

ggplot(diamonds, aes(x = y)) +
  geom_histogram(binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50))

unusual <- diamonds %>% 
  filter(y < 3 | y > 20) %>% 
  select(price, x, y, z) %>% 
  arrange(y)

unusual

diamonds2 <-  diamonds %>% 
  filter(between(y, 3, 20))

diamonds2 <- diamonds %>% 
  mutate(y = if_else(y < 3 | y > 20, NA, y))

ggplot(diamonds2, aes(x = x, y = y)) +
  geom_point()

ggplot(diamonds2, aes(x = x, y = y)) +
  geom_point(na.rm = TRUE)

nycflights13::flights %>% 
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %/% 100,
    sched_dep_time = sched_hour + (sched_min / 60)
  ) %>% 
  ggplot(aes(x = sched_dep_time)) +
  geom_freqpoly(aes(color = cancelled), binwidth = 1/4)

### Co-variation

#### A Categorical & a Numerical Variable

ggplot(diamonds, aes(x = price)) +
  geom_freqpoly(aes(color = cut), binwidth = 500, linewidth = 0.75)

ggplot(diamonds, aes(x = price, y = after_stat(density))) +
  geom_freqpoly(aes(color = cut), binwidth = 500, linewidth = 0.75)

ggplot(diamonds, aes(x = cut, y = price)) +
  geom_boxplot()

ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot()

ggplot(mpg, aes(x = fct_reorder(class, hwy, median), y = hwy)) +
  geom_boxplot()

ggplot(mpg, aes(x = hwy, y = fct_reorder(class, hwy, median))) +
  geom_boxplot()

### Two Categorical Variables

ggplot(diamonds, aes(x = cut, y = color)) +
  geom_count()

diamonds %>% 
  count(color, cut)

diamonds %>% 
  count(color, cut) %>% 
  ggplot(aes(x = color, y = cut)) +
  geom_tile(aes(fill = n))

### Two Numerical Variables















