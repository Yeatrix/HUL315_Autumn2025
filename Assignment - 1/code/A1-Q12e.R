slope_inches <- coef(model)[2]
slope_cm <- slope_inches / 2.54
intercept_cm <- coef(model)[1]
R2 <- summary(model)$r.squared
SER <- summary(model)$sigma

cat("Slope (in cm):", round(slope_cm, 4), "\n")
cat("Intercept:", round(intercept_cm, 2), "\n")
cat("R²:", round(R2, 4), "\n")
cat("Standard Error of Regression:", round(SER, 2), "\n")
