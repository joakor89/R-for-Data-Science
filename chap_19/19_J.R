# Joins

#### Pre-requisites

library(tidyverse)
library(nycflights13)

### Keys

#### Primary & Foreign Keys

airlines

airports

planes

weather

flights$tailnum

flights$carrier

flights$origin

flights$dest

flights$origin-flights$time_hour

#### Checking Primary Keys

planes %>% 
  count(tailnum) %>% 
  filter(n > 1)

weather %>% 
  count(time_hour, origin) %>% 
  filter(n > 1)

planes %>% 
  filter(is.na(tailnum))

weather %>% 
  filter(is.na(time_hour) | is.na(origin))

#### Surrogate Keys

flights %>% 
  count(time_hour, carrier, flight) %>% 
  filter(n > 1)

airports %>% 
  count(alt, lat) %>% 
  filter(n > 1)

flights2 <- flights %>% 
  mutate(id = row_number(), .before = 1)

flights2

### Basic Joins

#### Mutating Joins

flights2 <- flights %>% 
  select(year, time_hour, origin, dest, tailnum, carrier)

flights2

flights2 %>% 
  left_join(airlines)

flights2 %>% 
  left_join(weather %>% select(origin, time_hour, temp, wind_speed))

flights2 %>% 
  left_join(planes %>% select(tailnum, type, engines, seats))

flights2 %>% 
  filter(tailnum == "N3ALAA") %>% 
  left_join(planes %>% select(tailnum, type, engines, seats))

#### Specifying Join Keys

flights2 %>% 
  left_join(planes)

flights2 %>% 
  left_join(planes, join_by(tailnum))

flights2 %>% 
  left_join(airports, join_by(dest == faa))

flights2 %>% 
  left_join(airports, join_by(origin == faa))

#### Filtering Joins

airports %>% 
  semi_join(flights2, join_by(faa == origin))

airports %>% 
  semi_join(flights2, join_by(faa == dest))

flights2 %>% 
  anti_join(airports, join_by(dest == faa)) %>% 
  distinct(dest)

flights2 %>% 
  anti_join(planes, join_by(tailnum)) %>% 
  distinct(tailnum)

### How Do Joins Work?

x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  3, "x3"
)

y <- tribble(
  ~key, ~val_y,
  1, "y1", 
  2, "y2",
  4, "y3"
)

#### Row Matching

df1 <- tibble(key = c(1, 2, 2), val_x = c("x1", "x2", "x3"))
df2 <- tibble(key = c(1, 2, 2), val_y = c("y1", "y2", "y3"))

df1 %>% 
  inner_join(df2, join_by(key))

#### Non-Equis Joins

x %>% left_join(y, by = "key", keep = TRUE)














































































































