# Databases

#### Prerequisites

library(DBI)
library(dbplyr)
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
















































































































































