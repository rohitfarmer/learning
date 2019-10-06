### t-test with gardenA and gardenB data

g <- read.table("gardens.txt",header=TRUE)
attach(g)
ga <- gardenA
gb <- gardenB

# Manual t-test
d <- mean(ga) - mean(gb)
sedm <- sqrt( var(ga)/length(ga) + var(gb)/length(gb) )
t <- d/sedm
df <- length(ga)-1 + length(gb)-1
ct <- qt(0.025,df=df)
p <- 2*(1-pt(abs(t),df=df))

# Ready made t-test
t.test(ga,gb)
