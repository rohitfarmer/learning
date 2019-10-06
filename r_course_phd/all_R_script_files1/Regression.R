### Linear regressions

# Linear regression of Keq equilibrium constant as a function of pH
k <- read.table("Keq_PGM.txt",header=TRUE)
k
attach(k)
names(k)

plot(pH,K,type="p",las=1,ylab="Keq",main="Keq of PGM reaction")

model <- lm(K ~ pH)

# commands to get at the contents of our model
summary(model) # parameters, standard errors, F, p-value, and more
confint(model) # confidence intervals for the parameters
coef(model) # coefficients(model)
predict(model) # fitted(model) or fitted.values(model)
resid(model) # residuals(model)
influence.measures(model) # influence and leverage
plot(model, which=1:6) # up to 6 model checking diagnostics
abline(model) # quick way of plotting the regression line

# Linear regression of protein assay
prot <- read.table("protein_assay.txt",header=TRUE)
prot
attach(prot)
names(prot)
plot(protein,extinction,las=1,type="p")
model <- lm(extinction ~ 0 + protein) # this forces the intercept to 0
abline(model)
summary(model)
confint(model)
#plot(model, which=1:6)

# leave out the highest value
model <- lm(extinction ~ 0 + protein, subset=(protein<500))
abline(model,col="red")
summary(model)
confint(model)
#plot(model, which=1:6)

# from measured sample extinction to unknown concentration
e <- c(0.311, 0.728, 1.53)
p <- coef(model)
slope <- p[[1]]
slope
unknowns <- e/slope
unknowns


### Non-linear regressions

# Enzyme kinetics data, first linear, then Michaelis-Menten (MM), then substrate inhibition model
# LINEAR
act <- read.table("KMINDOL.txt",header=TRUE)
act
attach(act)
names(act)
s <- substrate_mM
a <- activity_U_per_mg
model <- lm(a ~ 0 + s) # force through origin
plot(s,a,las=1,type="p",xlim=c(0,10),ylim=c(0,6))
p <- coef(model)
k <- p[[1]]
x <- seq(0,10,length=200)
y <- k*x
lines(x,y,col="blue") # the linear model

plot(model, which=1:6)
plot(a,resid(model))
summary(model)
confint(model)
AIC(model)

# MM
model <- nls(a ~ (vm*s)/(ks+s),start=list(vm=6,ks=1))

p <- coef(model)
vm <- p[[1]]
ks <- p[[2]]
y <- (vm*x)/(ks+x)
lines(x,y,col="red")

# plot(model) # Doesn't work!!!
plot(a,resid(model))
summary(model)
confint(model)
AIC(model)

# Substrate inhibition
model <- nls(a ~ (vm*s)/(ks+s+s^2/kss),start=list(vm=6,ks=1,kss=10))
p <- coef(model)
vm <- p[[1]]
ks <- p[[2]]
kss <- p[[3]]
y <- (vm*x)/(ks+x+x^2/kss)
lines(x,y,col="green")

plot(a,resid(model))
summary(model)
confint(model)
AIC(model)

# Non-linear regression of Andreas' growth salt data
halo <- read.table("growth_salt.txt",header=TRUE)
halo
attach(halo)
names(halo)
plot(salt,growth,las=1,type="p",xlim=c(0,4),ylim=c(0,.5))

# Edwards
model <- nls(growth ~ (gm*salt)/(kn+salt) * exp(-salt/ki),start=list(gm=.5,kn=0.5,ki=2))

p <- coef(model)
gm <- p[[1]]
kn <- p[[2]]
ki <- p[[3]]
x <- seq(0,4,length=200)
y <- (gm*x)/(kn+x) * exp(-x/ki)
lines(x,y,col="red")

plot(growth,resid(model))
summary(model)
confint(model)
AIC(model)

# Yano Koga reduced
model <- nls(growth ~ (gm*salt)/(kn+salt+(salt^3/(k2^2))) ,start=list(gm=.5,kn=0.5,k2=2))

p <- coef(model)
gm <- p[[1]]
kn <- p[[2]]
k2 <- p[[3]]
x <- seq(0,4,length=200)
y <- (gm*x)/(kn+x+(x^3/(k2^2)))
lines(x,y,col="blue")

plot(growth,resid(model))
summary(model)
confint(model)
AIC(model)
