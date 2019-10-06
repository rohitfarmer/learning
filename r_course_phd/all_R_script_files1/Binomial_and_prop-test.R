### Binomial tests
## William J. Conover (1971), Practical nonparametric statistics. New York: John Wiley & Sons. Pages 97–104.
## Conover (1971), p. 97f.
## Under (the assumption of) simple Mendelian inheritance, a cross
##  between plants of two particular genotypes produces progeny 1/4 of
##  which are "dwarf" and 3/4 of which are "giant", respectively.
##  In an experiment to determine if this assumption is reasonable, a
##  cross results in progeny having 243 dwarf and 682 giant plants.
##  If "giant" is taken as success, the null hypothesis is that p =
##  3/4 and the alternative that p != 3/4.
binom.test(c(682, 243), p = 3/4)
binom.test(682, 682 + 243, p = 3/4) # The same
binom.test(243, 243 + 682, p = 1/4) # The same

# Promotions of male and female candidates
# 196 men promoted out of 3270 male candidates
# 4 females promoted out of 40 female candidates
prop.test(c(196, 4), c(3270, 40))
