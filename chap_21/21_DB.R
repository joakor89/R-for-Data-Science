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
con



















































































































































