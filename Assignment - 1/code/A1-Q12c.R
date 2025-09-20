library(readxl)
# Load dataset
file_path <- "../data/Earnings_and_Height.xlsx"

data <- read_excel(file_path)

# Scatterplot: earnings vs height
plot(data$height, data$earnings,
     xlab = "Height (inches)",
     ylab = "Annual Earnings ($2012)",
     main = "Scatterplot of Earnings vs Height",
     pch = 20, col = rgb(0,0,1,0.4))