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

#### Missing Values

NA > 5

##### 10 == NA

##### NA == NA

age_mary <- NA

age_john <- NA

age_mary == age_john

##### flights %>% 
##### filter(dep_time == NA)

#### is.na()

is.na(c(TRUE, NA, FALSE))

is.na(c(1, NA, 3))

is.na(c("a", NA, "b"))

flights %>% 
  filter(is.na(dep_time))

flights %>% 
  filter(month == 1, day == 1) %>% 
  arrange(dep_time)

flights %>% 
  filter(month == 1, day == 1) %>% 
  arrange(dep_time)

flights %>% 
  filter(month == 1, day == 1) %>% 
  arrange(desc(is.na(dep_time)), dep_time)

### Boolean Algebra

#### Missing Values

df <- tibble(x = c(TRUE, FALSE, TRUE))

df %>% 
  mutate(
    and = x & NA,
    or = x | NA
  )

#### Order of Operations

flights %>% 
  filter(month == 11 | month == 12)

flights %>% 
  filter(month == 11 | 12)

flights %>% 
  mutate(
    nov = month == 11,
    final = nov | 12,
    .keep = "used"
  )

#### %in%

1:12 %in% c(1, 5, 11)

letters[1:10] %in% c("a", "e", "i", "o", "u")

flights %>% 
  filter(month %in% c(11, 12))

c(1, 2, NA) == NA

c(1, 2, NA) %in% NA

flights %>% 
  filter(dep_time %in% c(NA, 0800))

### Summaries

#### Logical Summaries

flights %>% 
  group_by(year, month, day) %>% 
  summarize(
    all_delayed = all(dep_delay <= 60, na.rm = TRUE),
    any_long_delay = any(arr_delay >= 300, na.rm = TRUE),
    .groups = "drop"
  )

#### Numeric Summaries of Logical Vectors

flights %>% 
  group_by(year, month, day) %>% 
  summarize(
    all_delayed = mean(dep_delay <= 60, na.rm = TRUE),
    any_long_delay = sum(arr_delay >= 300, na.rm = TRUE),
    .groups = "drop"
  )

# Logical Sub-setting

flights %>% 
  filter(arr_delay > 0) %>% 
  group_by(year, month, day) %>% 
  summarize(
    behind = mean(arr_delay),
    n = n(),
    .groups = "drop"
  )

flights %>% 
  group_by(year, month, day) %>% 
  summarize(
    behind = mean(arr_delay[arr_delay > 0], na.rm = TRUE),
    ahead = mean(arr_delay[arr_delay < 0], na.rm = TRUE),
    n = n(),
    .groups = "drop"
  )

### Conditional Transformations

#### if_else()

x <- c(-3:3, NA)

if_else(x > 0, "+ve", "-ve", "???")

if_else(x < 0, -1, x)

x1 <- c(NA, 1, 2, NA)
y1 <- c(3, NA, 4, 6)

if_else(is.na(x1), y1, x1)

if_else(x == 0, "0", if_else(x < 0, "-ve", "ve"), "???")

#### case_when()

x <- c(-3:3, NA)
case_when(
  x == 0 ~ "0",
  x < 0 ~ "-ve",
  x > 0 ~ "+ve",
  is.na(x) ~ "???"
)

case_when(
  x < 0 ~ "ve",
  x > 0 ~ "+ve"
)

case_when(
  x < 0 ~ "ve",
  x > 0 ~ "+ve",
  TRUE ~ "???"
)

case_when(
  x < 0 ~ "+ve",
  x > 2 ~ "big"
)

flights %>% 
  mutate(
    status = case_when(
      is.na(arr_delay) ~ "cancelled",
      arr_delay < -30 ~ "very early",
      arr_delay < -15 ~ "early",
      abs(arr_delay) <= 15 ~ "on time",
      arr_delay < 60 ~ "late",
      arr_delay < Inf ~ "very late",
    ),
    .keep = "used"
  )

####



















































