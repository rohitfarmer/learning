### Read in data
g <- read.table("growth_burden.txt",header=T)
attach(g)
names(g)
str(g)
#need to turn Temp into a factor for Anova!
Temp <- as.factor(Temp)
g$Temp <- as.factor(g$Temp)
str(g)

### Choose contrasts for ANOVA (no effect on TukeyHSD)
# default contrasts in R are treatment contrasts, not orthogonal
# intercept is the first level in the alphabet
# contrast each level with the baseline level
options( contrasts = c("contr.treatment","contr.poly") )
# Helmert contrasts are orthogonal, intercept is overall mean
# first contrast compares level 2 with level 1
# second contrast compares level 3 against average of level 2 and 1
options( contrasts = c("contr.helmert","contr.poly") )

### ANOVA with Rate as response variable, the rest as explanatory variables
model <- aov(Rate ~ Strain + Plasmid + Temp + Medium)
summary(model)
model
summary.lm(model)
summary.aov(model)
model.tables(model)
contrasts(Strain)
contrasts(Plasmid)
interaction.plot(Strain, Plasmid, Rate)

# Tukey's Honest Significant Differences for multiple comparisons
# results do not depend on choice of contrasts
TukeyHSD(model, ordered = FALSE, conf.level = 0.95)
