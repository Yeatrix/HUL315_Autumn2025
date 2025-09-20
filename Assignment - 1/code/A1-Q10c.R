data <- read.csv("../data/datadino.csv")

# find the unique string values in the dataset column
datasets <- unique(data$dataset)
n = length(datasets)
print(n) 
mrow = ceiling(sqrt(n))
mcol = ceiling(n/mrow)

# Arrange plots in a grid
par(mfrow = c(mrow, mcol))  

for (d in datasets) {
  subset_data <- subset(data, dataset == d)
  
  # Scatter plot
  plot(subset_data$x, subset_data$y,
       main = paste("dataset =", d),
       xlab = "x", ylab = "y",
       pch = 19, col = "blue")
  
  # Fit regression line
  model <- lm(data$y ~ data$x, data = subset_data)
  abline(model, col = "red", lwd = 2)
}