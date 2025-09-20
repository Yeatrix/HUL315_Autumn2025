library(readxl)
# Load dataset 
file_path <- "../data/Earnings_and_Height.xlsx"

data <- read_excel(file_path)

# Filter to females only (sex = 0)
female_data <- subset(data, sex == 0)

# Regression: Earnings on Height
model_female <- lm(earnings ~ height, data = female_data)
summary(model_female)

# Extract slope
slope <- coef(model_female)[2]
cat("Estimated slope (beta_1):", round(slope, 4), "\n")

# Prediction for "1 inch taller than average woman"
mean_height_female <- mean(female_data$height)
mean_earnings_female <- mean(female_data$earnings)

# Predicted earnings at mean height
pred_mean <- predict(model_female,
                     newdata = data.frame(height = mean_height_female))

# Predicted earnings at mean height + 1
pred_plus1 <- predict(model_female,
                      newdata = data.frame(height = mean_height_female + 1))

diff <- pred_plus1 - pred_mean

cat("\nAverage female height:", round(mean_height_female, 2), "inches\n")
cat("Average female earnings (sample): $", round(mean_earnings_female, 2), "\n")
cat("Predicted increase in earnings for +1 inch:", round(diff, 2), "\n")