### Parametric and non-parametric Confidence Intervals

### Parametric CI for normally distributed data, based on t
se <- sqrt(var(ga)/length(ga))
t <- qt(c(0.025,0.975),df=length(ga)-1)
ci <- t * se
ci
mean(ga)

### CI by bootstrapping

# read in data (ozone concentrations in three gardens)
g <- read.table("gardens.txt",header=TRUE)
g
ga <- g$gardenA
gb <- g$gardenB

# CI by bootstrapping
m <- numeric(10000)
for (i in 1:10000) {
	m[i] <- mean(sample(ga,5,replace=TRUE))
}
mean(ga)
mean(m)
quantile(m,c(0.025,0.975))
