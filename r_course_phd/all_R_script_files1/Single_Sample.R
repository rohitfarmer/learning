### Single sample statistics

# read data: ozone concentrations in garden A
g <- read.table("gardens.txt",header=TRUE)
ga <- g$gardenA
ga
sort(ga)

boxplot(ga)

# Calculate a bunch of statistics

# Mean
m <- mean(ga)
m

# Median
median(ga)

# Percentiles
quantile(ga)

# Residuals
r <- ga-m
r

# Median absolute deviation
mad(ga)

# Sum of Squares
ss <- sum(r^2)
ss

# Variance
var(ga)

# Standard Deviation
s <- sqrt(var(ga)) # option 1
s <- sd(ga) # option 2
s

# Standard error
se <- sqrt(var(ga)/length(ga))
se

# Coefficient of Variation
cv <- s/m
cv
