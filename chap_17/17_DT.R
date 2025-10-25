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

#### From Other Types

as_datetime(today())

as_date(now())

as_datetime(60 * 60 * 10)

as_date(365 * 10 + 2)

### Date-Time Components

#### Getting Components

datetime <- ymd_hms("2026-07-08 12:34:56")

year(datetime)

month(datetime)

mday(datetime)

yday(datetime)

wday(datetime)

month(datetime, label = TRUE)

wday(datetime, label = TRUE, abbr = FALSE)

flights_dt %>% 
  mutate(wday = wday(dep_time, label = TRUE)) %>% 
  ggplot(aes(x = wday)) +
  geom_bar()

flights_dt %>% 
  mutate(minute = minute(dep_time)) %>% 
  group_by(minute) %>% 
  summarize(
    avg_delay = mean(dep_delay, na.rm = TRUE),
    n = n()
  ) %>% 
  ggplot(aes(x = minute, y = avg_delay)) +
  geom_line()

sched_dep <- flights_dt %>% 
  mutate(minute = minute(sched_dep_time)) %>% 
  group_by(minute) %>% 
  summarize(
    avg_delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  )

ggplot(sched_dep, aes(x = minute, y = avg_delay)) +
  geom_line()

#### Rounding

flights_dt %>% 
  count(week = floor_date(dep_time, "week")) %>% 
  ggplot(aes(x = week, y = n)) +
  geom_line() +
  geom_point()

flights_dt %>% 
  mutate(dep_hour = dep_time - floor_date(dep_time, "day")) %>% 
  ggplot(aes(x = dep_hour)) +
  geom_freqpoly(binwidth = 60 * 30)

flights_dt %>% 
  mutate(dep_hour = hms::as_hms(dep_time - floor_date(dep_time, "day"))) %>% 
  ggplot(aes(x = dep_hour)) +
  geom_freqpoly(binwidth = 60 * 30)

#### Modifying Components

(datetime <- ymd_hms("2026-07-08 12:34:56"))

year(datetime) <- 2030
datetime

month(datetime) <- 01
datetime

hour(datetime) <- hour(datetime) + 1
datetime

update(datetime, year = 2030, month = 2, mday = 2, hour = 2)

update(ymd("2023-02-01"), mday = 30)

update(ymd("2023-02-01"), hour = 400)

### Time Spans

#### Durations

h_age <- today() - ymd("1979-10-14")
h_age

as.duration(h_age)

dseconds(15)

dminutes(10)

dhours(c(12, 24))

ddays(0:5)

dweeks(3)

dyears(1)

2 * dyears(1)

dyears(1) + dweeks(12) + dhours(15)

tomorrow <- today() + ddays(1)
last_year <- today() - dyears(1)

one_am <- ymd_hms("2026-03-08 01:00:00", tz = "America/New York")

one_am

#### Periods









































