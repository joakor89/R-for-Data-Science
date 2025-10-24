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






























































