# plot sin, cos, and cos + noise

# plot sin
x <- seq(-2*pi,2*pi,length=101) # make vector x
y <- sin(x) # calculate vector y as a function of x
plot(x,y)
plot(x,y, las=1, xlab="x", ylab="sin(x)", type="l", main="Trigonometric functions")

# plot sin and add cos and cos + noise
plot(x,y, las=1, xlab="x", ylab="f(x)", type="l")
lines(x,cos(x),col="red")
points(x, cos(x)+rnorm(length(x), mean=0, sd=0.1), col="blue") # cos(x) with some noise added
title("Trigonometric functions")
text(0.5*pi+pi/4, sin(0.5*pi), "sin(x)")

