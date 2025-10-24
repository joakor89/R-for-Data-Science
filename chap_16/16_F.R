# Factors

#### Pre-requisites
library(tidyverse)

### Factors Basics

x1 <- c("Dec", "Apr", "Jan", "Mar")

x2 <- c("Dec", "Apr", "Jam", "Mar")

sort(x1)

month_levels <- c(
  "Jan", "Feb", "Mar", "Apr", "May", "Jun",
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
)

y1 <- factor(x1, levels = month_levels)
y1

sort(y1)

y2 <- factor(x2, levels = month_levels)
y2

y2 <- fct(x2, levels = month_levels)

factor(x1)

fct(x1)

levels(y2)

csv <- "
month,value
Jan,12
Feb,56
Mar,12"

df <- read_csv(csv, col_types = cols(month = col_factor(month_levels)))

df$month

### General Social Survey

gss_cat

?gss_cat

gss_cat %>% 
  count(race)

### Modifying Factor Order

relig_summary <- gss_cat %>% 
  group_by(relig) %>% 
  summarize(
    tvhours = mean(tvhours, na.rm = TRUE),
    n = n()
  )

ggplot(relig_summary, aes(x = tvhours, y = relig)) +
  geom_point()

ggplot(relig_summary, aes(x = tvhours, y = fct_reorder(relig, tvhours))) +
  geom_point()

relig_summary %>% 
  mutate(
    relig = fct_reorder(relig, tvhours)
  ) %>% 
  ggplot(aes(x = tvhours, y = relig)) +
  geom_point()

rincome_summary <- gss_cat %>% 
  group_by(rincome) %>% 
  summarize(
    age = mean(age, na.rm = TRUE),
    n = n()
  )

ggplot(rincome_summary, aes(x = age, y = fct_reorder(rincome, age))) +
  geom_point()

ggplot(rincome_summary, aes(x = age, y = fct_relevel(rincome, "Not applicable"))) +
  geom_point()

by_age <- gss_cat %>% 
  filter(!is.na(age)) %>% 
  count(age, marital) %>% 
  group_by(age) %>% 
  mutate(
    prop = n / sum(n)
  )

ggplot(by_age, aes(x = age, y = prop, color = marital)) +
  geom_line(linewidth = 1) +
  scale_color_brewer(palette = "Set1")

ggplot(by_age, aes(x = age, y = prop, color = fct_reorder2(marital, age, prop))) +
  geom_line(linewidth = 1) +
  scale_color_brewer(palette = "Set1") +
  labs(color = "marital")

gss_cat %>% 
  mutate(marital = marital %>% fct_infreq() %>% fct_rev()) %>% 
  ggplot(aes(x = marital)) +
  geom_bar()

###
















































































































