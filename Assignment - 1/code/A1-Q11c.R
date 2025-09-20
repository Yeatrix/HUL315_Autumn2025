# Load the data
data <- read.csv("../data/energy_gdp.csv")

# Take logs
data$log_rgdp <- log(data$rgdp)
data$log_energy <- log(data$energy)

# Run regression
model <- lm(log_energy ~ log_rgdp, data = data)

# Extract coefficient and standard error for log_rgdp
beta_hat <- coef(summary(model))["log_rgdp", "Estimate"]
se_beta <- coef(summary(model))["log_rgdp", "Std. Error"]

# Hypothesis test: H0: beta = 1
t_stat <- (beta_hat - 1) / se_beta
df <- model$df.residual
p_value <- 2 * pt(-abs(t_stat), df)

cat("Beta estimate:", beta_hat, "\n")
cat("t-statistic:", t_stat, "\n")
cat("p-value:", p_value, "\n")
