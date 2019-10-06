### Contingency tables, Chi-square and Fisher's exact test

x <- seq(0,5,length=1000)
plot(x,dchisq(x,1),las=1,type="l",main="Chi-square density function",xlab="x")
lines(x,dchisq(x,2),col="red")
lines(x,dchisq(x,3),col="green")
lines(x,dchisq(x,4),col="blue")

qchisq(0.95, 1)

### Contingency table
freq <- matrix(c(38,14,11,51), nrow=2)
freq

chisq.test(freq)

fisher.test(freq)

### Contingency table
ants <- matrix(c(6,4,2,8), nrow=2)
ants

chisq.test(ants)

fisher.test(ants)
