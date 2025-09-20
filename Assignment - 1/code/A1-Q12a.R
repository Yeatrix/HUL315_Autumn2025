library(readxl) 
  
file_path <- "../data/Earnings_and_Height.xlsx"
data <- read_excel(file_path)


cat("Rows:", nrow(data), "  Columns:", ncol(data), "\n")
str(data)
cat("\nSummary of 'height' column:\n")
print(summary(data$height))

# ------- Compute median height (overall) -------

median_height <- median(data$height)
cat("\nMedian height (overall):", median_height, "inches\n")
