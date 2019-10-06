### KS-test
w <- read.table("wings.txt",header=TRUE)
attach(w)
names(w)
table(location)
A <- size[location == "A"]
B <- size[location == "B"]

ks.test(A,B)

t.test(A,B)

var.test(A,B)

require(MASS)
truehist(A,breaks=14:35,las=1,xlab="Wing sizes in Location A",ylab="Frequency")
truehist(B,breaks=14:35,las=1,xlab="Wing sizes in Location B",ylab="Frequency")

# KS-test wings versus normal
ks.test(B,"pnorm",mean=mean(B),sd=sqrt(var(B)))

require(MASS)
Bf <- fitdistr(B,"normal")
BFc <- coef(Bf)
x <- seq(min(B),max(B),length=100)
d <- dnorm(x,mean=BFc[[1]],sd=BFc[[2]])
truehist(B,breaks=14:35,las=1,xlab="Wing sizes in Location B",ylab="Frequency")
lines(x,d)
