cricket <- read.csv("cricket.csv")
ggplot(cricket[cricket$player == "de villiers",], aes(x = runs)) +
  geom_histogram(color = "black", fill = "#007749") +
  ggtitle("Histogram of Runs for AB de Villiers")
ggplot(cricket[cricket$player == "kohli",], aes(x = runs)) +
  geom_histogram(color = "black", fill = "#00bfff") +
  ggtitle("Histogram of Runs for Virat Kohli")

cricket
table(cricket$player)
filter(cricket,player == "AB de Villiers")

cricket %>%
  group_by(player) %>%
  summarise(mean = mean(runs,na.rm = TRUE))


cricket %>%
  group_by(player) %>%
  summarise(n=n(),
            mean=mean(runs),
            sd = sd(runs))%>%
  as.data.frame()



summary(cricket)

cricket %>%
  group_by(player) %>%
  summarise(max_runs = max(runs, na.rm = TRUE))
## t-test

t.test(runs ~ player, data = cricket, var.equal = TRUE)


# Define a function to calculate confidence interval
calculate_ci <- function(mean, sd, n, conf_level = 0.95) {
  error_margin <- qt(1 - (1 - conf_level) / 2, df = n - 1) * (sd / sqrt(n))
  lower_bound <- mean - error_margin
  upper_bound <- mean + error_margin
  return(c(lower = lower_bound, upper = upper_bound))
}

# Example usage
mean_value <- 50
sd_value <- 10
sample_size <- 30
conf_level <- 0.95

ci <- calculate_ci(mean_value, sd_value, sample_size, conf_level)
print(ci)




