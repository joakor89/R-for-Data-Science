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








































































































