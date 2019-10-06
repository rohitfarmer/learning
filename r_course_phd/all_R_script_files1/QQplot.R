### Quantile-Quantile plot

# read data
w <- read.table("wings.txt",header=TRUE)
attach(w)
names(w)
table(location)
A <- size[location == "A"]
B <- size[location == "B"]

# now make QQplots
qqnorm(A)
qqline(A)
text(locator(1),"Wing sizes A")

plot(sort(B))
qqnorm(B)
qqline(B)
text(locator(1),"Wing sizes B")

# now try to do it by hand
mb <- mean(B)
vb <- var(B)
nb <- length(B)
rb <- rnorm(nb,mean=mb,sd=sqrt(vb))
plot(sort(rb),sort(B))

# random walk and Normal distribution
N <- 10000 # number of particles
n <- 100 # number of steps (of equal length)

rend <- numeric(N)
for (i in 1:N) {
	r <- runif(n,0,1)
	left <- r <= 0.5
	right <- r > 0.5
	r[left] <- 0
	r[right] <- 1
	rend[i] <- sum(right) - sum(left)
}
truehist(rend,x0=0.5,xlab="Particle position after n steps",main="1D random walk of N particles")
qqnorm(rend)
qqline(rend)
text(locator(1),"Random walk data")

### control qqplot with normal data
r <- rnorm(1000)
plot(sort(r))
qqnorm(r)
qqline(r)
text(locator(1),"Normally distributed data")
