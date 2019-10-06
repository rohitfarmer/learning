hill <- function(x) {
	h <- 4
	vmax <- 1
	ks <- 10
	y <- vmax * x^h / (ks^h + x^h)
	y
}