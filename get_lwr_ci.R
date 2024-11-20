# get_lwr_ci()
#
# Calculates the lower bound of the standard CI for normally
# distributed data with unknown variance (don't worry, we will
# learn more about this interval in the coming weeks).
#
# Input:
# x     - a vector of numbers.
# level - the confidence level we need, between 0 and 1, e.g.,
#         enter 0.95 for a 95% interval.
#
# Output:
# The lower bound of the confidence interval.

get_lwr_ci <- function(x, level = 0.95){
  # calculate the mean
  m <- mean(x, na.rm = TRUE)
  # calculate the standard error
  s <- sd(x, na.rm = TRUE)
  n <- length(x)
  se <- s/sqrt(n)
  # calculate the critical value
  a <- (1-level)/2
  t <- qt(a, df = n-1, lower.tail = FALSE)
  # calculate the lower bound
  lwr <- m-t*se
  # return
  return(lwr)
}


get_upr_ci <- function(x, level = 0.95){
  # calculate the mean
  m <- mean(x, na.rm = TRUE)
  # calculate the standard error
  s <- sd(x, na.rm = TRUE)
  n <- length(x)
  se <- s/sqrt(n)
  # calculate the critical value
  a <- (1-level)/2
  t <- qt(a, df = n-1, lower.tail = FALSE)
  # calculate the lower bound
  lwr <- m+t*se
  # return
  return(lwr)
}