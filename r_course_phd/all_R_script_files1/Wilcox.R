### Wilcoxon's rank sum test

# read data
g <- read.table("gardens.txt",header=TRUE)
attach(g)

# Manual version
# pool data
ozone <- c(gardenA,gardenB)
labels <- c(rep("A",length(gardenA)), rep("B",length(gardenB)))
# rank pooled data
combined.ranks <- rank(ozone)
# work out rank sum by label (separately for gardens A and B)
tapply(combined.ranks,labels,sum)

# Ready-made version
wilcox.test(gardenA,gardenB)
