# Exploratory Data Analysis

### Prerequisites

library(tidyverse)

### Variation 

ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.5)

### Typical Values

smaller <- diamonds %>% 
  filter(carat < 3)

ggplot(smaller, aes(x = carat)) +
  geom_histogram(binwidth = 0.01)

### 

















