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

# fit position data to Normal distribution
require(MASS) # fitdistr() function is in package MASS
f <- fitdistr(rend,"normal") # fit counts to Normal distribution
fc <- coef(f) # get coefficients (parameters) from the fit: mean and sd
fc
x <- seq(min(rend),max(rend),length=200)
d <- dnorm(x,mean=fc[1],sd=fc[2]) # calculate (probability) densities of theoretical Normal distribution with fitted mean and sd
lines(x,d,lwd=2)
