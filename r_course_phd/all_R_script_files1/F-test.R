### F-test

g <- read.table("gardens.txt",header=TRUE)
g
attach(g)
ga <- gardenA
gb <- gardenB
gc <- gardenC

mean(ga)
mean(gb)
mean(gc)

var(ga)
var(gb)
var(gc)

f <- var(gc)/var(gb)
f
qf(0.975, length(gc)-1, length(gb)-1)
pf(f, length(gc)-1, length(gb)-1)
cf <- 2*(1-pf(f, length(gc)-1, length(gb)-1))
cf
var.test(gc,gb)

# Plot F-distribution, shape depends on df
x <- seq(0,4,length=1000)
plot(x,df(x,9,9),type="l",las=1)
