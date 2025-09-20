# Load the data
data <- read.csv("energy_gdp.csv")

# Take logs
data$log_rgdp <- log(data$rgdp)
data$log_energy <- log(data$energy)

# Run regression: log(Real GDP) ~ log(Energy)
model_rev <- lm(log_rgdp ~ log_energy, data = data)

# Report coefficients
delta <- coef(model_rev)[1]
gamma <- coef(model_rev)[2]

cat("Delta (Intercept):", delta, "\n")
cat("Gamma (Slope):", gamma, "\n")

# Show summary if you want more details
summary(model_rev)
