# Missing Values

#### Pre-requisites
library(tidyverse)

### Explicit Missing Values

treatment <- tribble(
  ~person,            ~treatment, ~response,
  "Derrick Whitmore", 1,          7,
  NA,                 2,          10,
  NA,                 3,          NA,
  "Katherine Burke",  1,          4
)

treatment %>% 
  fill(everything())


#### Fixed Values

x <- c(1, 4, 5, 7, NA)
coalesce(x, 0)

x <- c(1, 4, 5, 7, -99)
na_if(x, -99)

#### Nan





































































































