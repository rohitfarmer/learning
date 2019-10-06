# draw Poisson distributions with various lambdas
k <- 0:10
d <- dpois(k,lambda=0.5)
plot(k-0.15,d,xlab="k (# of events per interval)",ylab="Probability",las=1,col="black",type="h",lwd=2)
text(locator(1),"0.5",col="black")
d <- dpois(k,lambda=1)
points(k-0.05,d,col="red",type="h",lwd=2)
text(locator(1),"1.0",col="red")
d <- dpois(k,lambda=2)
points(k+0.05,d,col="green",type="h",lwd=2)
text(locator(1),"2.0",col="green")
d <- dpois(k,lambda=4)
points(k+0.15,d,col="blue",type="h",lwd=2)
text(locator(1),"4.0",col="blue")
