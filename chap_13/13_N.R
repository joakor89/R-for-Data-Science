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

#### Modular Arithmetic

1:10 %/% 3

1:10 %% 3

flights %>% 
  mutate(
    hour = sched_dep_time %/% 100,
    minute = sched_dep_time %% 100,
    .keep = "used"
  )

flights %>% 
  group_by(hour = sched_dep_time %/% 100) %>% 
  summarize(prop_cancelled = mean(is.na(dep_time)), n = n()) %>% 
  filter(hour > 1) %>% 
  ggplot(aes(x = hour, y = prop_cancelled)) +
  geom_line(color = "grey50") +
  geom_point(aes(size = n))

#### Rounding

round(123.456)

round(123.456, 2)

round(123.456, 1)

round(123.456, -1)

round(123.456, -2)

round(c(1.5, 2.5))

x <- 123.456

floor(x)

ceiling(x)

floor(x / 0.01) * 0.01

ceiling(x / 0.01) * 0.01

round(x / 4) * 4

round(x / 0.25) * 0.25

#### Cutting Numbers into Ranges

x <- c(1, 2, 5, 10, 15, 20)

cut(x, breaks = c(0, 5, 10, 15, 20))

cut(x, breaks = c(0, 5, 10, 100))

cut(x,
    breaks = c(0, 5, 10, 15, 20),
    labels = c("sm", "md", "lg", "xl")
)

y <- c(NA, -10, 5, 10, 30)
cut(y, breaks = c(0, 5, 10, 15, 20))

#### Cumulative & Rolling Aggregates

x <- 1:10

cumsum(x)

cumprod(x)

cummin(x)

cummax(x)

### General Transformations

#### Ranks

x <- c(1, 2, 2, 3, 4, NA)

min_rank(x)

min_rank(desc(x))

df <- tibble(x = x)

df %>% 
  mutate(
    row_number = row_number(x),
    dense_rank = dense_rank(x),
    dense_rank = percent_rank(x),
    cume_dist = cume_dist(x)
  )

#### Offsets

x <- c(2, 5, 11, 19, 35)
lag(x)

lead(x)

x - lag(x)

x == lag(x)


#### Consecutive Identifiers

events <- tibble(
  time = c(0, 1, 2, 3, 5, 10, 12, 15, 17, 19, 20, 27, 28, 30)
)

events <- events %>% 
  mutate(
    diff = time - lag(time, default = first(time)),
    has_gap = diff >= 5
  )

events

events %>% mutate(
  group = cumsum(has_gap)
  )
                 
df <- tibble(
  x = c("a", "a", "a", "b", "c", "c", "d", "e", "a", "a", "b", "b"),
  y = c(1, 2, 3, 2, 4, 1, 3, 9, 4, 8, 10, 199)
)

df %>% 
  group_by(id = consecutive_id(x)) %>% 
  slice_head(n = 1)































