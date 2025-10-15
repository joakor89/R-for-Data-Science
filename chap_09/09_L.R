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

### Statistical Transformations

ggplot(diamonds, aes(x = cut)) +
  geom_bar()

diamonds %>% 
  count(cut) %>% 
  ggplot(aes(x = cut, y = n)) +
  geom_bar(stat = "identity")

ggplot(diamonds, aes(x = cut, y = after_stat(prop), group = 1)) +
  geom_bar()

ggplot(diamonds) +
  stat_summary(
    aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )

ggplot(diamonds, aes(x = cut, y = after_stat(prop))) +
  geom_bar()
ggplot(diamonds, aes(x = cut, fill = color, y = after_stat(prop))) +
  geom_bar()

### Position Adjustments

##### Left 
ggplot(mpg, aes(x = drv, color = drv)) +
  geom_bar()

##### Right
ggplot(mpg, aes(x = drv, fill = drv)) +
  geom_bar()

##### Stacking
ggplot(mpg, aes(x = drv, fill = class)) +
  geom_bar()

##### Left 
ggplot(mpg, aes(x = drv, fill = class)) +
  geom_bar(alpha = 1/5, position = "identity")

##### Right
ggplot(mpg, aes(x = drv, color= class)) +
  geom_bar(fill = NA, position = "identity")

##### Left 
ggplot(mpg, aes(x = drv, fill = class)) +
  geom_bar(position = "fill")

##### Right
ggplot(mpg, aes(x = drv, fill = class)) +
  geom_bar(position = "dodge")

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(position = "jitter")

?position_dodge

?position_fill

?position_identity

?position_jitter

?position_stack

### Coordinate Systems

nz <- map_data("nz")

ggplot(nz, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "white", color = "black")

ggplot(nz, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "white", color = "black") +
  coord_quickmap()

bar <- ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = clarity, fill = clarity),
    show.legend = FALSE,
    width = 1
  ) +
  theme(aspect.ratio = 1)

bar + coord_flip()
bar + coord_polar()

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() +
  geom_abline() +
  coord_fixed()


