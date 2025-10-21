# Strings

### Pre-requisites

library(tidyverse)
library(babynames)

### Creating a String

string1 <- "This is a string"

string2 <- 'If I want to include a "quote" inside a string, I use single quotes'

#### Escapes

double_quote <- "\"" # or '"'

single_quote <- '\'' # or "'"

backslash <- "\\"

x <- c(single_quote, double_quote, backslash)
x

str_view(x)

