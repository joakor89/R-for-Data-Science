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
  geom_point(mapping = aes(color= species, shape = species)) +
  geom_smooth(method = "lm")

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color= species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body Mass & Flipper Length",
    subtitle = "Dimensions for Adelie Chinstrap and Gentoo Penguins",
    x = "Flipper Length (mm)",
    y = "Body Mass (g)",
    color = "Species",
    shape = "Species"
    ) +
  scale_color_colorblind()

### Exercises

#### 1) -> 8 columns
View(penguins)

#### 2)
ggplot(
  data = penguins,
  mapping = aes(x = bill_depth_mm, y = bill_length_mm, color = species)
) +
  geom_point()

#### 4) -> It shown a vertical relationship visualization
ggplot(
  data = penguins,
  mapping = aes(x = species, y = bill_depth_mm, color = species)
) +
  geom_point()

#### 5) -> Error in `geom_point()`:
ggplot(
  data = penguins
) + 
  geom_point()

#### 9) -> 
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE)

#### 10) ->
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_smooth(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  )

### ggplot2 Calls
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point()


ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()

#### -> with pipeline
penguins |>
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()

## Visualization Distribution

### A Categorical Variable
ggplot(penguins, aes(x = species)) +
  geom_bar()

ggplot(penguins, aes(x = fct_infreq(species))) +
  geom_bar()













