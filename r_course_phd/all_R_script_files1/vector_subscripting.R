# vector subscripting excercise

# make a vector from 0 to 99
v <- 0:99

# select first element
v[1]

# select last element
v[100]
v[length(v)]

# select 10 in the middle
v[46:55]

# select the last 50 elements
v[51:100]

# select elements based on logical conditions

# all elements smaller than 10
v[v < 10]

# all elements smaller and equal to 10
v[v <= 10]

# all elements equal to 10
v[v == 10]

# all elements equal to 100
v[v == 100]

# all elements equal to 0.1
v[v == 0.1]

## More examples

v <- runif(500,min=0,max=1) # make vector of random numbers (500 elements, uniformly distributed in the interval 0 to 1
mean(v) # this uses all elements of v
v[1] # first element
v[length(v)] # last element since length() gives number of elements
v[v > 0.8] # all elements for which a condition is true, here > 0.8 (larger than 0.8)
v[v == 0.8] # unlikely to get a hit
v[v == mean(v)] # also unlikely to get a hit
v[101:200] # a section in the middle (100 elements]
v[(length(v)-99):length(v)] # use the last 100 elements (maybe you want to select the final stage)