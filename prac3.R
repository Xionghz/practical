library(tidyverse)
data("mpg",package = "ggplot2")
mpg
## scatterplots

ggplot(mpg, aes(x = displ, y = cty))+
  geom_point()

## color
ggplot(mpg, aes(x = displ, y = cty, col = drv)) +
  geom_point()

## legends position
ggplot(mpg, aes(x = displ, y = cty, col = drv)) +
  geom_point() +
  theme(legend.position = "bottom")

## shapes,
ggplot(mpg, aes(x = displ, y = cty, col = class, shape = drv)) +
  geom_point()

## multiple plots
ggplot(mpg, aes(x = displ, y = cty)) +
  geom_point() +
  facet_grid(class ~ drv)

#If we want to produce separate plots for only a single variable, we can use the facet_wrap() function:

ggplot(mpg, aes(x = displ, y = cty)) +
  geom_point() +
  facet_wrap(~ class)

## adding summary to plots line of best fit
ggplot(mpg, aes(x = displ, y = cty)) +
  geom_point() +
  geom_smooth(method = "lm")

## with different color
ggplot(mpg, aes(x = displ, y = cty, col = drv)) +
  geom_point() +
  geom_smooth(method = "lm")

## box plot

ggplot(mpg, aes(x = drv, y = cty)) +
  geom_boxplot()
