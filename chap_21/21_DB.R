# Databases

#### Prerequisites

library(DBI)
library(dbplyr)
library(duckdb)
library(tidyverse)

### Database Basics 

#### Connecting to a Database

con <- DBI::dbConnect(
  RMariaDB::MariaDB(),
  username = "foo"
)

con <- DBI::dbConnect(
  RPostgres::Postgres(),
  hostname = "databases.mycompany.com",
  port = 1234
)

#### ITB
con <- DBI::dbConnect(duckdb::duckdb())

con <- DBI::dbConnect(duckdb::duckdb(), dbdir = "duckdb")

#### Load Some Data

dbWriteTable(con, "mpg", ggplot2::mpg)
dbWriteTable(con, "diamonds", ggplot2::diamonds)

#### DBI Basics

dbListTables(con)

con %>% 
  dbReadTable("diamonds") %>% 
  as_tibble()

sql <- "
SELECT carat, cut, clarity, color, price
FROM diamonds
WHERE price > 15000
"

as_tibble(dbGetQuery(con, sql))

#### dbplyr Basics

diamonds_db <- tbl(con, "diamonds")
diamonds_db

diamonds_db <- tbl(con, in_schema("sales", "diamonds"))
diamonds_db <- tbl(
  con, in_catalog("north_america", "sale", "diamonds")
)

diamonds_db <- tbl(con, sql("SELECT * FROM diamonds"))

big_diamonds_db <- diamonds_db %>% 
  filter(price > 15000) %>% 
  select(carat::clarity, price)

big_diamonds_db %>% 
  show_query()

big_diamonds <- big_diamonds_db %>% 
  collect()

big_diamonds

### SQL
dbplyr::copy_nycflights13(con)

flights <- tbl(con, "flights")
planes <- tbl(con, "planes")

#### SQL Basic

flights %>% show_query()

planes %>% show_query()

flights %>% 
  filter(dest == "IAH") %>% 
  arrange(dep_delay) %>% 
  show_query()

flights %>% 
  group_by(dest) %>% 
  summarize(dep_delay = mean(dep_delay, na.rm = TRUE)) %>% 
  show_query()

#### SELECT

planes %>% 
  select(tailnum, type, manufacturer, model, year) %>% 
  show_query()

planes %>% 
  select(tailnum, type, manufacturer, model, year) %>% 
  rename(year_built = year) %>% 
  show_query()

flights %>% 
  mutate(
    speed = distance / (air_time / 60)
  ) %>% 
  show_query()

#### GROUP BY

diamonds_db %>% 
  group_by(cut) %>% 
  summarize(
    n = n(),
    avg_price = mean(price, na.rm = TRUE)
  ) %>% 
  show_query()

#### WHERE

flights %>% 
  filter(dest == "IAH" | dest == "HOU") %>% 
  show_query()

flights %>% 
  filter(arr_delay > 0 & arr_delay < 20) %>% 
  show_query()

flights %>% 
  filter(dest %in% c("IAH", "HOU")) %>% 
  show_query()

flights %>% 
  group_by(dest) %>% 
  summarize(delay = mean(arr_delay))

flights %>% 
  filter(!is.na(dep_delay)) %>% 
  show_query()

##### WHERE "dep_delay" IS NOT NULL

diamonds_db %>% 
  group_by(cut) %>% 
  summarize(n = n()) %>% 
  filter(n > 100) %>% 
  show_query()

### ORDER BY

flights %>% 
  arrange(year, month, day, desc(dep_delay)) %>% 
  show_query()

#### Subqueries

flights %>% 
  mutate(
    year1 = year + 1,
    year2 = year1 + 1
  ) %>% 
  show_query()

flights %>% 
  mutate(year1 = year + 1) %>% 
  filter(year1 == 2014) %>% 
  show_query()

#### Joins

flights %>% 
  left_join(planes %>% rename(year_built = year), by = "tailnum") %>% 
  show_query()

### Functions Translations

summarize_query <- function(df, ...) {
  df %>% 
    summarize(...) %>% 
    show_query()
}
mutate_query <- function(df, ...) {
  df %>% 
    mutate(..., .keep = "none") %>% 
    show_query()
}

flights %>% 
  group_by(year, month, day) %>% 
  summarize_query(
    mean = mean(arr_delay, na.rm = TRUE),
    median = median(arr_delay, na.rm = TRUE)
  )

flights %>% 
  group_by(year, month, day) %>% 
  mutate_query(
    mean = mean(arr_delay, na.rm = TRUE),
  )

flights %>% 
  group_by(dest) %>% 
  arrange(time_hour) %>% 
  mutate_query(
    lead = lead(arr_delay),
    lag = lag(arr_delay)
  )

flights %>% 
  mutate_query(
    description = if_else(arr_delay > 0, "delayed", "on-time")
  )

flights %>% 
  mutate_query(
    description = 
      case_when(
        arr_delay < -5 ~ "early",
        arr_delay < 5 ~ "on-time",
        arr_delay >= 5 ~ "late"
      )
  )

flights %>% 
  mutate_query(
    description = cut(
      arr_delay,
      breaks = c(-Inf, -5, 5, Inf),
      labels = c("early", "on-time", "late")
    )
  )













































































































