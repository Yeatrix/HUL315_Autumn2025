# Load the data
data <- read.csv("../data/energy_gdp.csv")

# Take logs of GDP and Energy
data$log_rgdp <- log(data$rgdp)
data$log_energy <- log(data$energy)

# Run simple linear regression
model <- lm(log_energy ~ log_rgdp, data = data)

# Display regression summary
summary(model)

# Extract point estimates of alpha (intercept) and beta (slope)
alpha <- coef(model)[1]
beta <- coef(model)[2]

cat("Alpha (Intercept):", alpha, "\n")
cat("Beta (Slope):", beta, "\n")
