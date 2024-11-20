### Load data and libraries
library(tidyverse)
data("mpg", package = "ggplot2")
mpg


# Filter
table(mpg$manufacturer)

filter(mpg,manufacturer == "nissan")

filter(mpg,cyl == 6, drv == "f")

##filter nissan or toyota
filter(mpg, manufacturer %in% c("nissan","toyota"))

filter(mpg, manufacturer == "nissan"|manufacturer == "toyota")


## select

select(mpg,model,trans)

select(mpg,contains("dis"))

# select a range from dips to cyl
select(mpg,displ:cyl)

## mutate

mutate(mpg, cty_kmpl = cty * 0.425144)
mpg<-mutate(mpg, cty_kmpl = cty * 0.425144)

mpg

## magrittr

mpg_vw <- filter(mpg, manufacturer == "volkswagen")
mpg_trans2cty <- select(mpg_vw, trans:cty)
mpg_trans2cty_km <- mutate(mpg_trans2cty, cty_kmpl = cty * 0.425144)
mpg_trans2cty_km


mpg %>%
  filter(manufacturer == "volkswagen")%>%
  select(trans:cty) %>%
  mutate(cty_kmpl = cty * 0.4525144)
mpg

filter(mpg, manufacturer == "volkswagen",cty_kmpl>8.5)

## group_by and summarize

mpg %>%
  group_by(manufacturer) %>%
  summarise(mean = mean(cty,na.rm = TRUE))
mpg


mpg %>%
  group_by(manufacturer) %>%
  summarise(mean = mean(cty, na.rm = TRUE),
            n = n(),#count
            sd = sd(cty, na.rm = TRUE))#standard deviation

##Functions
source("get_lwr_ci.R")

get_lwr_ci(mpg$cty)


#name <- function(argument) {
#  # do some things
#  return(value)
#}

mpg_q7 <-mpg%>%
  filter(manufacturer == "chevrolet")

get_lwr_ci(mpg_q7$cty)  
get_upr_ci(mpg_q7$cty)


