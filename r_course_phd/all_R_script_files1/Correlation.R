### Covariance and correlation
# water table example data
water <- read.table("water_table.txt",header=TRUE)
attach(water)
names(water)

cor(Summer, Winter)

cor.test(Summer,Winter)

### Correlation of sine and cosine?
x <- seq(0,4*pi,pi/10)
y <- cos(x)
cor(x,y)
cor.test(x,y)
plot(x,y)

cor(x,y,method="kendall")
cor.test(x,y,method="kendall")

cor(x,y,method="spearman")
cor.test(x,y,method="spearman")
