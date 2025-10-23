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

df <- tribble(
  ~str,
  "<Sheryl>-F_34",
  "<Kisha>-F_45",
  "<Brandon>-N_33",
  "<Sharon>-F_38",
  "<Penny>-F_58",
  "<Justin>-M_41",
  "<Patricia>-F_84",
)

df %>% 
  separate_wider_regex(
    str,
    patterns = c(
      "<",
      name = "[A-Za-z]+",
      ">-",
      gender = ".", "_",
      age = "[0-9]+"
    )
  )

### Pattern Details

#### Escaping

dot <- "\\."

str_view(dot)

str_view(c("abc", "a.c", "bef"), "a\\.c")

x <- "a\\b"

str_view(x)

str_view(x, "\\\\")

str_view(x, r"{\\}")

str_view(c("abc", "a.c", "a*c", "a c"), "a[.]c")

str_view(c("abc", "a.c", "a*c", "a c"), ".[*]c")

#### Anchors

str_view(fruit, "^a")

str_view(fruit, "a$")

str_view(fruit, "apple")

str_view(fruit, "^apple$")

x <- c("summary(x)", "summarize(df)", "rowsum(x)", "sum(x)")
str_view(x, "sum")

str_view(x, "\\bsum\\b")

str_view("abc", c("$", "^", "\\b"))

str_replace_all("abc", c("$", "^", "\\b"), "--")

#### Character Classes

x <- "abcd ABCD 12345 -!@#%."
str_view(x, "[abc]+")

str_view(x, "[a-z]+")

str_view(x, "[^a-z0-9]+")

str_view("a-b-c", "[a-c]")

str_view("a-b-c", "[a-c]")

str_view("a-b-c", "[a\\-c]")

x <- "abcd ABCD 12345 -!@#%."
str_view(x, "\\d+")

str_view(x, "\\D+")

str_view(x, "\\s+")

str_view(x, "\\S+")

str_view(x, "\\w+")

str_view(x, "\\W+")

### Quantifiers

#### Grouping & Capturing

str_view(fruit, "(..)\\1")

str_view(words, "^(..).*\\1$")

sentences %>% 
  str_replace("(\\w+) (\\w+) (\\w+)", "\\1 \\3 \\2") %>% 
  str_view()

sentences %>% 
  str_match("the (\\w+) (\\w+)") %>% 
  head()

sentences %>% 
  str_match("the (\\w+) (\\w+)") %>% 
  as_tibble(.name_repair = "minimal") %>% 
  set_names("match", "word1", "word2")

x <- c("a gray cat", "a grey dog")
str_match(x, "gr(e|a)y")

str_match(x, "gr(?:e|a)y")

### Pattern Control

#### Regex Flags

bananas <- c("banana", "Banana", "BANANA")

str_view(bananas, "banana")

str_view(bananas, regex("banana", ignore_case = TRUE))

x <- "Line 1\nLine 2\nLine 3"

str_view(x, ".Line")

str_view(x, regex(".Line", dotall = TRUE))

x <- "Line 1\nLine 2\nLine 3"

str_view(x, "^Line")

str_view(x, regex("^Line", multiline = TRUE))

phone <- regex(
  r"(
  \(? #optional opening parens
  (\d{3}) # area code
  [)\-]? #optional closing parens or dash
  \ ? # optional space
  (\d{3}) # another three numbers
  [\ -]? # optional space or dash
  (\d{4}) # for more numbers
  )",
  comments = TRUE
)

str_extract(c("514-791-8141", "(123) 456 7890", "123456"), phone)

#### Fixed Matches

str_view(c("", "a", "."), fixed("."))

str_view("x X", "X")

str_view("x X", fixed("X", ignore_case = TRUE))

str_view("i İ ı I", fixed("İ", ignore_case = TRUE))

str_view("i İ ı I", coll("İ", ignore_case = TRUE, locale = "tr"))

##### Checking Work

str_view(sentences, "^The")

str_view(sentences, "^The\\b")

str_view(sentences, "^She|He|It|They\\b")

str_view(sentences, "^(She|He|It|They)\\b")

pos <- c("He is a boy", "She had a good time")

neg <- c("Shells come from the sea", "Hadley said 'It's a great day")


















          
 
  