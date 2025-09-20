library(readxl)

# Load dataset 
file_path <- "../data/Earnings_and_Height.xlsx"

data <- read_excel(file_path)

# Avg earnings of workers of height <= 67
short_workers <- subset(data, height <= 67)
avg_earnings_short <- mean(short_workers$earnings)
cat("Average earnings for workers with height <= 67: $", round(avg_earnings_short, 2), "\n")
