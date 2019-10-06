# matrix subscripting exercise

v <- 0:15
v
A <- matrix(v,4,4)
A

# select the entire first row
A[1,]
# select the entire first column
A[,1]
# select the block in the middle
A[2:3,2:3]
# select the last two entire columns
A[,3:4]
# select all values larger than 10
A[A > 10]
