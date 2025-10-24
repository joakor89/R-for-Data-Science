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































































