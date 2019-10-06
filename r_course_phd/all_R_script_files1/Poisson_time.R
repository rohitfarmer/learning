# Radioactive decay or Poisson distribution in time
eve <- 100 # events
int <- 200 # intervals
m <- eve/int # mean
steps <- 100 # steps per interval
dt <- 1/steps # time step length as a fraction of the interval
p <- dt * m # event probability, should be very small
x <- rep(0,int*steps)
r <- runif(int*steps,0,1)
i <- r < p
x[i] <- 1 # 1 means event is TRUE
xa <- (1:(int*steps))/steps
plot(xa,x,type="h",las=1,lab=c(5,1,0),xlab="Time",ylab="Events",main="Events over time") # spikes for events
s <- sum(i)
s/int # should approximate mean

# plot interval borders on top
lines(0:int,rep(1,int+1),col="red",type="h")


# count events in each interval
counts <- rep(0,int)
for (i in 1:int) {
	counts[i] <- sum(x[(1+(i-1)*steps):(i*steps)])
}
# scale this to get same scale and layout as in other figures for overlay in Powerpoint
#plot(0:int,c(0,c),col="blue",type="h",las=1,lab=c(5,4,0),xlab="Time interval",ylab="Counts",main="Counts per time interval")
# unscaled version
#plot(counts,col="blue",type="h",las=1,xlab="Time interval",ylab="Counts",main="Counts per time interval")
sum(counts)

# vector counts contains counts: number of events in each interval
cs <- table(counts) # produces a table object (a kind of list) summarizing all counts
cs <- cs[] # convert list into vector of counts
ke <- sort(unique(counts)) # all empirical k's (there can be gaps)
kt <- min(counts):max(counts) # for theoretical distribution, want no gaps

# fit Poisson distribution
require(MASS) # fitdistr() function is in package MASS
f <- fitdistr(counts,"poisson") # fit counts to Poisson distribution
fc <- coef(f) # get coefficients (parameters) from the fit, Poisson has only 1!
d <- dpois(kt,lambda=fc) # calculate (probability) densities of theoretical Poisson distribution with fitted lambda

# plot data and then fit on top of data
plot(ke,cs/sum(cs),xlab="Number of events per interval",ylab="Probability",las=1,pch="+") # normalize counts by total
points(kt,d,col="red")
