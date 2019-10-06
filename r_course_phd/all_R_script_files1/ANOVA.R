### ANOVA of garden data 

oneway <- read.table("oneway.txt", header=TRUE)
attach(oneway)
names(oneway)
len <- length(ozone)
mt <- mean(ozone)
oa <- ozone[garden == "A"]
ob <- ozone[garden == "B"]
ma <- mean(oa)
mb <- mean(ob)

### ANOVA by hand
# sums of squares
SStot <- sum((ozone-mean(ozone))^2)
SStot
SSerrA <- sum((oa-mean(oa))^2)
SSerrA
SSerrB <- sum((ob-mean(ob))^2)
SSerrB
SSerr <- SSerrA + SSerrB
SSerr
SSfa <- SStot - SSerr
SSfa

# variances
VARerr <- SSerr/(len-2)
VARerr
VARfa <- SSfa/1
VARfa
# F-ratio
F <- VARfa/VARerr
F
# critical F to test hypothesis
qf(0.95,1,len-2)
# p-value
1-pf(F,1,len-2)

### t-test
t.test(oa,ob)

### ready-made Anova
model <- aov(ozone ~ garden)
summary(model)
plot(model, which=1:6)
