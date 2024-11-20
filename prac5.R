library(tidyverse)
data("mpg", package = "ggplot2")
mpg


mpg %>%
  ggplot(aes(x = displ, y = cty)) +
  geom_point()


## simple linear regression
m1 <- lm(cty ~ displ, data = mpg)
summary(m1)

summary(m1)$coefficients

summary(m1)$coefficients[2,1]

library(broom)
tidy(m1)

glance(m1)


par(mfrow = c(2,2))
plot(m1)

plot(m1, which = 2)
residuals(m1)
fitted(m1)
predict(m1)[1:5]

new_cars <- data.frame(displ = 3:6)
new_cars
new_cars$pred <- predict(m1, newdata = new_cars)

new_cars


m2 <- lm(cty ~ drv, data = mpg)
summary(m2)
