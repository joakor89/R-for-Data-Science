# Layers

# Prerequisites

library(tidyverse)

### Aesthetic Mappings

mpg

ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy, shape = class)) +
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy, size = class)) +
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy, alpha = class)) +
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(color = "royalblue")


ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(color = "royalblue", shape = 2)

### 


