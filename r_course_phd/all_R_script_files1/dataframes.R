### Dataframe reading, 'sorting', plotting

# read data and check and plot
# this dataframe has a header and row names in column 1, not all dataframes do!
worms <- read.table("worms.txt",header=TRUE,row.names=1)
worms
class(worms)
names(worms)
plot(worms)

plot(Soil.pH,Worm.density) # error, objects (variables) not known
attach(worms)
plot(Soil.pH,Worm.density)

summary(worms)
worms[,4] # all rows, column 4
worms[Soil.pH >= 5,] # those rows with pH >= 5, all columns

sort(Soil.pH) # don't use sort on dataframes, it will only sort one column, leaving the rest of the row as it was
i <- order(Soil.pH) # use order instead, order returns subscripts (indices)
i
Soil.pH
Soil.pH[i]
worms[i,]
worms

ws <- worms[order(Soil.pH),] # all in one line
ws <- worms[order(worms[,4]),] # the same

detach(worms) # undo attach
rm(worms) # rm for remove