# uniform random pattern of cells
n <- 10 # length of domain
x <- runif(100,0,n)
y <- runif(100,0,n)
plot(x, y, xlab="", ylab="", axes=FALSE)

# draw grid for counting
abline(h=0:n) # horizontal lines
abline(v=0:n) # vertical lines

# count automatically
c <- matrix(numeric(10^2),nrow=10)
# visit all points and convert coordinates into integers
for (i in 1:length(x)) {
	xi <- ceiling(x[i])
	yi <- ceiling(y[i])
	c[yi,xi] <- c[yi,xi] + 1
}
c

# vector c contains counts: number of events in each interval
cs <- table(c) # produces a table object (a kind of list) summarizing all counts
cs <- cs[] # convert list into vector of counts
cs
k <- min(c):max(c)

# fit count data to Poisson distribution
require(MASS) # fitdistr() function is in package MASS
f <- fitdistr(c,"poisson") # fit counts to Poisson distribution
fc <- coef(f) # get coefficients (parameters) from the fit, Poisson has only 1!
fc
d <- dpois(k,lambda=fc) # calculate (probability) densities of theoretical Poisson distribution with fitted lambda

# plot count data and then fitted Poisson distribution on top of data
plot(k,cs/sum(cs),xlab="Number of cells per grid element",ylab="Probability",las=1,pch="+") # normalize counts by total
points(k,d,col="red")
