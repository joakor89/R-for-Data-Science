# Regular Expressions

### Pre-requisites

library(tidyverse)
library(babynames)

### Pattern Basics

str_view(fruit, "berry")

str_view(c("a", "ab", "ae", "bd", "ea", "eab"), "a.")

str_view(fruit, "a...e")

str_view(c("a", "ab", "abb"), "ab?")

str_view(c("a", "ab", "abb"), "ab+")

str_view(c(c("a", "ab", "abb"), "ab*"))

str_view(words, "[aeiou]x[aeiou]")

str_view(words, "[^aeiou]y[^aeiou]")

str_view(fruit, "apple|melon|nut")

str_view(fruit, "aa|ee|ii|oo|uu")

### Key Functions

#### Detect Matches

str_detect(c("a", "b", "c"), "[a,e,i,o,u]")

babynames %>% 
  filter(str_detect(name, "x")) %>% 
  count(name, wt = n, sort = TRUE)

babynames %>% 
  group_by(year) %>% 
  summarize(prop_x = mean(str_detect(name, "x"))) %>% 
  ggplot(aes(x = year, y = prop_x)) +
  geom_line()

#### Count Matches




























































































          
 
  