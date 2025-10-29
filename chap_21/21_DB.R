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













































































































































