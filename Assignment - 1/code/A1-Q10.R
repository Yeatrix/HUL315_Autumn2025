# load the data in variable "data"

data <- read.csv("../data/datadino.csv")

# create a vector of unique string values in dataset column 
datasets <- unique(data$dataset)

n <- length(datasets)
mrow <- ceiling(sqrt(n))
mcol <- ceiling(n / mrow)
par(mfrow = c(mrow,mcol))

# Creating one plot per dataset
for (d in datasets) {
  subset_data <- subset(data, dataset == d)
  
  plot(subset_data$x, subset_data$y,
       main = paste("dataset =", d),
       xlab = "x", ylab = "y",
       pch = 19,
	 col = "blue")
}
