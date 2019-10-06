# plot a parabola, it’s inverse, and the axis of symmetry

x <- seq(0,2,length=100)
plot(x,x^2,type="l",col="red",las=1,xlab="x",ylab="f(x)")
lines(x,sqrt(x),col="blue")
lines(x,x,col="black")
