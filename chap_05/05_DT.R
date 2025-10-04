# Data Tidying

library(tidyverse)

### Tidy Data

table1

table2

table3

##### Computing rate per 10000
table1 %>% 
  mutate(rate = cases / population * 10000)

##### Computing total cases per year
table1 %>% 
  group_by(year) %>% 
  summarize(total_cases = sum(cases))

##### Visualizing changes over time
ggplot(table1, aes(x = year, y = cases)) +
  geom_line(aes(group = country), color = "grey50") +
  geom_point(aes(color = country, shape = country)) +
  scale_x_continuous(breaks = c(1999, 2000))

### Lengthening Data

#### Data in Column Names

billboard

##### pivot_longer()

billboard %>% 
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    values_to = "rank"
  )

billboard %>% 
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    values_to = "rank",
    values_drop_na = TRUE
  )

billboard_longer <- billboard %>% 
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    values_to = "rank",
    values_drop_na = TRUE
  ) %>% 
  mutate(
    week = parse_number(week)
  )

billboard_longer

billboard_longer %>% 
  ggplot(aes(x = week, y = rank, group = track)) +
  geom_line(alpha = 0.25) +
  scale_y_reverse()

#### How Does Pivoting Work?

df <- tribble(
  ~id, ~bp1, ~bp2,
  "A", 100, 120,
  "B", 140, 115,
  "C", 120, 125
)

df %>% 
  pivot_longer(
    cols = bp1:bp2,
    names_to = "measurement",
    values_to = "value"
  )







