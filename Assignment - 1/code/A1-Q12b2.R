library(readxl)

# Load dataset 
file_path <- "../data/Earnings_and_Height.xlsx"

data <- read_excel(file_path)

# Avg earnings of workers of height > 67
tall_workers <- subset(data, height > 67)
avg_earnings_tall <- mean(tall_workers$earnings)
cat("Average earnings for workers with height > 67: $", round(avg_earnings_tall, 2), "\n")
