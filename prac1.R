print ("hello world")
# loading packages

library(tidyverse)
library(readxl)

# Working Directory

getwd()
setwd("../../adelaide/2024t3/SMI/revision")

# Reading Data

P1_data <- read_excel("SMI_P1_data.xlsx")
P1_data

# data.frame (tibble)
# select first row
P1_data[1,]
# select first column
P1_data[,1]
# row 2 col 3
P1_data[2,3]
# names
P1_data$name

###Data cleaning
# all of the different values : table()
table(P1_data$sex)
# Find all cases of sex = "-" and overwrite these as NA
P1_data$sex[P1_data$sex == "-"] <- NA
table(P1_data$sex)

# show NA
table(P1_data$sex, useNA = "always")

# Combine levels : fct_recode()
P1_data$sex <- fct_recode(P1_data$sex,
                          female = "F",
                          female = "Female",
                          male = "Male")
table(P1_data$sex, useNA = "always")

### Redefining class of variable
P1_data
# convert variable class
# check NA
table(P1_data$weight, useNA = "always")
P1_data$weight <- as.numeric(P1_data$weight)
# summary statistics
summary(P1_data)
mean(P1_data$weight, na.rm = TRUE)
sd(P1_data$weight, na.rm = TRUE)
median(P1_data$weight, na.rm = TRUE)

### Plot
ggplot(P1_data, aes(weight)) +
  geom_histogram()

ggplot(P1_data, aes(transport)) +
  geom_bar()


### saving data
write_rds(P1_data,"P1_clean.rds")
clean_data<-read_rds("P1_clean.rds")
