##z test
ci_upper <- function(m,n,s,a){
  # calculate the mean
  # calculate the standard error
  se <- s/sqrt(n)
  # calculate the critical value
  z <- qnorm(1-a)
  # calculate the lower bound
  upr <- m+z*se
  # return
  return(upr)
}

ci_lwr <- function(m,n,s,a){
  # calculate the mean
  # calculate the standard error
  se <- s/sqrt(n)
  # calculate the critical value
  z <- qnorm(1-a)
  # calculate the lower bound
  upr <- m-z*se
  # return
  return(upr)
}
#--------------------------------------------------------------------
#qt(1-a,n-1)
#
ci_upper(0.63,136,sqrt(13),0.025)

ci_lwr(-0.3114,100,sqrt(4),0.1)

#--------------------------------------------------------------------

## power
# Parameters
n <- 100  # sample size
mu_0 <- 0  #an
mu <- 0.4  # true mean null hypothesis me
alpha <- 0.01  # significance level
sigma <- 1  # population standard deviation

# Standard error
SE <- sigma / sqrt(n)

# Critical value for two-tailed test at alpha = 0.01
z_alpha <- qnorm(1 - alpha/2)

# Compute the Z-scores under the alternative hypothesis
z1 <- (mu_0 + z_alpha * SE - mu) / SE
z2 <- (mu_0 - z_alpha * SE - mu) / SE

# Power of the test
power <- 1 - (pnorm(z1) - pnorm(z2))
round(power, 3)


