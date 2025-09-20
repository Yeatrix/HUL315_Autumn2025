# Load the data
data <- read.csv("../data/energy_gdp.csv")

# Take logs of GDP and Energy
data$log_rgdp <- log(data$rgdp)
data$log_energy <- log(data$energy)

# Run simple linear regression
model <- lm(log_energy ~ log_rgdp, data = data)

# Extract residuals
residuals <- resid(model)

# Plot residuals vs. fitted values
plot(fitted(model), residuals,
     xlab = "Fitted values (log(Energy))",
     ylab = "Residuals",
     main = "Residual Plot")
abline(h = 0, col = "red", lty = 2)
