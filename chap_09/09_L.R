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

### Geometric Objects

##### Left
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()

##### Right
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth()

##### Left
ggplot(mpg, aes(x = displ, y = hwy, shape = drv)) +
  geom_smooth()

##### Right
ggplot(mpg, aes(x = displ, y = hwy, linetype = drv)) +
  geom_smooth()

ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  geom_smooth(aes(linetype = drv))

##### Left 
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth()

##### Middle 
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth(aes(group = drv))

##### Right
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth(aes(color = drv), show.legend = FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth()

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_point(
    data = mpg %>% filter(class == "2seater"),
    color = "red"
  ) +
  geom_point(
    data = mpg %>% filter(class == "2seater"),
    shape = "circle open", size = 3, color = "red"
  )


##### Left 
ggplot(mpg, aes(x = hwy)) +
  geom_histogram(binwidth = 2)

##### Middle 
ggplot(mpg, aes(x = hwy)) +
  geom_density()

##### Right
ggplot(mpg, aes(x = hwy)) +
  geom_boxplot()

library(ggridges)

ggplot(mpg, aes(x = hwy, y = drv, fill = drv, color = drv)) +
  geom_density_ridges(alpha = 0.5, show.legend = FALSE)

### Facets

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~cyl)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_grid(drv ~ cyl)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_grid(drv ~ cyl, scales = "free_y")



















