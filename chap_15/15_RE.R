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

x <- c("apple", "banana", "pear")
str_count(x, "p")

str_count("abababa", "aba")

str_view("abababa", "aba")

babynames %>% 
  count(name) %>% 
  mutate(
    vowels = str_count(name, "[aeiou]"),
    consonants = str_count(name, "[^aeiou]")
  )

babynames %>% 
  count(name) %>% 
  mutate(
    name = str_to_lower(name),
    vowels = str_count(name, "aeiou"),
    consonants = str_count(name, "[^aeiou]")
  )

#### Replace Values

x <- c("apple", "pear", "banana")
str_replace_all(x, "[aeiou]", "-")

x <- c("apple", "pear", "banana")
str_remove_all(x, "[aeiou]")

#### Extract Variables














































































          
 
  