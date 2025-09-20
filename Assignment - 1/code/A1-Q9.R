set.seed(2160)

# vector x, dim : (1000 x 1), values from a uniform distribution between 0 and 1
x <- runif(1000, min = 0, max = 1)

# vector y, dim : (1000 x 1), values from the mean of x
y <- numeric(1000)
for (i in 1:1000) {
  r_sample <- sample(x, size = 100, replace = FALSE)
  y[i] <- mean(r_sample)
}

# compute stats
mean_x <- mean(x); sd_x <- sd(x)
mean_y <- mean(y); sd_y <- sd(y)

# plot histograms
hist(x, breaks = 30, probability = TRUE, col = rgb(0,0,1,0.4),
     main = "Comparison of distribution of X (blue) and Y (red)", xlab = "Value", ylim = c(0, 15))
hist(y, breaks = 30, probability = TRUE, col = rgb(1,0,0,0.4), add = TRUE)

# legend
legend("topright", legend = c("X (raw data)", "Y (sample means)"),
       fill = c(rgb(0,0,1,0.3), rgb(1,0,0,0.4)))

# add mean and sd text to plot
text(0.85, 10.5, paste0("X: mean=", round(mean_x,3), ", sd=", round(sd_x,3)), col = "blue")
text(0.85, 9.5, paste0("Y: mean=", round(mean_y,3), ", sd=", round(sd_y,3)), col = "red")
