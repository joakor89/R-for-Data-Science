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

### Creating Many Strings from Data

#### str_c()

str_c("x", "y")

str_c("x", "y", "z")

str_c("Hello ", c("John", "Susan"))

df <- tibble(name = c("Flora", "David", "Terra", NA))

df %>% mutate(greeting = str_c("Hi ", name, "!"))

df %>% 
  mutate(
    greeting1 = str_c("Hi ", coalesce(name, "you"), "!"),
    greeting2 = coalesce(str_c("Hi ", name, "!"), "Hi!")
  )

#### str_glue()

df %>% mutate(greeting = str_glue("Hi {name}!"))

df %>% mutate(greeting = str_glue("{{Hi {name}!}}"))

#### str_flatten()

str_flatten(c("x", "y", "z"))

str_flatten(c("x", "y", "z"), ", ")

str_flatten(c("x", "y", "z"), ", ", last = ", and ")

df <- tribble(
  ~ name, ~ fruit,
  "Carmen", "banana",
  "Carmen", "apple",
  "Marvin", "nectarine",
  "Terence", "cantaloupe",
  "Terence", "papaya",
  "Terence", "mandaring",
)

df %>% 
  group_by(name) %>% 
  summarize(fruits = str_flatten(fruit, ", "))

### Extracting Data from Strings

#### Separating into Rows

df <- tibble(x = c("a,b,c", "d,e", "f"))

df %>% 
  separate_longer_delim(x, delim = ",")

df2 <- tibble(x = c("1211", "131", "21"))

df2 %>% 
  separate_longer_position(x, width = 1)

#### Sepa




































