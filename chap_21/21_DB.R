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



































































































































