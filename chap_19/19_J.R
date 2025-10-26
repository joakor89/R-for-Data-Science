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

### 











































































































