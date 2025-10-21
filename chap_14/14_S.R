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

#### Raw Strings

tricky <- " double_quote <- \"\\\"\"  # or '\"'
single_quote <- '\\'' # or \"'\""

str_view(tricky)

tricky <- r"(double_quote <- "\"" # or '"'
single_quote <- '\'' # or "'")"

str_view(tricky)

#### Other Special Characters

x <- c("one\ntwo", "one\ttwo", "\u00b5", "\u0001f604")

x

##









