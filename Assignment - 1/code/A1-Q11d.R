# Load the data
data <- read.csv("energy_gdp.csv")

# (d) Wrongly recorded energy: multiply one country's energy by 1000
# Let's assume it's the first country (row 1)
data$energy[1] <- data$energy[1] * 1000

# Take logs
data$log_rgdp <- log(data$rgdp)
data$log_energy <- log(data$energy)

# Run regression
model_wrong <- lm(log_energy ~ log_rgdp, data = data)

# (a) Report coefficients
alpha <- coef(model_wrong)[1]
beta <- coef(model_wrong)[2]
cat("Alpha (Intercept):", alpha, "\n")
cat("Beta (Slope):", beta, "\n\n")

# (b) Plot residuals
residuals <- resid(model_wrong)
plot(fitted(model_wrong), residuals,
     xlab = "Fitted values (log(Energy))",
     ylab = "Residuals",
     main = "Residual Plot with Wrong Data")
abline(h = 0, col = "red", lty = 2)

# (c) Test H0: beta = 1
beta_hat <- coef(summary(model_wrong))["log_rgdp", "Estimate"]
se_beta <- coef(summary(model_wrong))["log_rgdp", "Std. Error"]
t_stat <- (beta_hat - 1) / se_beta
df <- model_wrong$df.residual
p_value <- 2 * pt(-abs(t_stat), df)

cat("Hypothesis Test (H0: beta = 1)\n")
cat("Beta estimate:", beta_hat, "\n")
cat("t-statistic:", t_stat, "\n")
cat("p-value:", p_value, "\n")
