# Data Visualization

### Loading Packages
install.packages("tidyverse")

install.packages(c("arrow", "babynames", "curl", "duckdb", "gapminder", "ggrepel",
                   "ggridges", "ggthemes", "hexbin", "janitor", "Lahman", "leaflet", "maps",
                   "nycflights13", "openxlsx", "palmerpenguins", "repurrrsive", "tidymodels", "writexl"))

### Running R Code
1 + 2

### Prerequisites
library(tidyverse)
library(palmerpenguins)
library(ggthemes)

### Penguing Dataframe
penguins

glimpse(penguins)

View(penguins)

### Creating a `ggplot`
ggplot(data = penguins)


ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
  )

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point()

### Adding Aesthetics & Layers

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) +
  geom_point()


ggplot(
  data = penguins,
  #### Global level
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) +
  geom_point() +
  geom_smooth(method = "lm")

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  #### Local level
  geom_point(mapping = aes(color= species)) +
  geom_smooth(method = "lm")

