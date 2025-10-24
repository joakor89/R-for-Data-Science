# Dates & Times

#### Pre-requisites
library(tidyverse)
library(nycflights13)

### Creating Dates/Times

today()

now()

#### During Import

csv <- "
date,datetime
2022-01-02-01-02 05:12
"

csv <- "
date
01/02/15
"

read_csv(csv, col_types = cols(date = col_date("%m/%d/%y")))

read_csv(csv, col_types = cols(date = col_date("%d/%m/%y")))

read_csv(csv, col_types = cols(date = col_date("%y/%m/%d")))

#### From Strings

ymd("2017-01-31")

mdy("January 31st, 2017")

dmy("31-Jan-2017")

ymd_hms("2017-01-31 20:11:59")

mdy_hm("01/31/3017 08:01")

ymd("2017-01-31", tz = "UTC")

#### From Individual Components

flights %>% 
  select(year, month, day, hour, minute)

flights %>% 
  select(year, month, day, hour, minute) %>% 
  mutate(departure = make_datetime(year, month, day, hour, minute))

make_datetime_100 <- function(year, month, day, time) {
  make_datetime(year, month, day, time %/% 100, time %% 100)
}

flights_dt <- flights %>% 
  filter(!is.na(dep_time), !is.na(arr_time)) %>% 
  mutate(
    dep_time = make_datetime_100(year, month, day, dep_time),
    arr_time = make_datetime_100(year, month, day, arr_time),
    sched_dep_time = make_datetime_100(year, month, day, sched_dep_time),
    sched_arr_time = make_datetime_100(year, month, day, sched_arr_time)
  ) %>% 
  select(origin, dest, ends_with("delay"), ends_with("time"))

flights_dt

flights_dt %>% 
  ggplot(aes(x = dep_time)) +
  geom_freqpoly(binwidth = 86400)

flights_dt %>% 
  filter(dep_time < ymd(20130102)) %>% 
  ggplot(aes(x = dep_time)) +
  geom_freqpoly(binwidth = 600)

#### 





















































