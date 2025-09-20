# Load the data
data <- read.csv("energy_gdp.csv")

# Take logs
data$log_rgdp <- log(data$rgdp)
data$log_energy <- log(data$energy)

# Model 1: log(Energy) ~ log(Real GDP)
model1 <- lm(log_energy ~ log_rgdp, data = data)
R2_model1 <- summary(model1)$r.squared

# Model 2: log(Real GDP) ~ log(Energy)
model2 <- lm(log_rgdp ~ log_energy, data = data)
R2_model2 <- summary(model2)$r.squared

# Report results
cat("R-squared (Model 1: log(Energy) ~ log(Real GDP)):", R2_model1, "\n")
cat("R-squared (Model 2: log(Real GDP) ~ log(Energy)):", R2_model2, "\n")
