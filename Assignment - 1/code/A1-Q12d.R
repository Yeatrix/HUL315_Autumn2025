library(readxl)
# Load dataset 
file_path <- "../data/Earnings_and_Height.xlsx"

data <- read_excel(file_path)

# Regression: Earnings on Height
model <- lm(earnings ~ height, data = data)
summary(model)

# Find slope (coefficient on height)
slope <- coef(model)[2]
cat("Estimated slope (beta_1):", round(slope, 4), "\n")

# -------- Predictions --------
new_data <- data.frame(height = c(67, 70, 65))
predicted <- predict(model, newdata = new_data)

results <- data.frame(Height = new_data$height,
                      Predicted_Earnings = round(predicted, 2))
print(results)
