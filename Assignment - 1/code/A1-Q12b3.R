library(readxl)

#load data
file_path <- "../data/Earnings_and_Height.xlsx"

data <- read_excel(file_path)

# divide in two sub dataset
tall <- subset(data, height > 67)$earnings
short <- subset(data, height <= 67)$earnings

# calculate average earnings of two groups
mean_tall <- mean(tall)
mean_short <- mean(short)
diff_means <- mean_tall - mean_short

cat("Average earnings (tall):   $", round(mean_tall, 2), "\n")
cat("Average earnings (short):  $", round(mean_short, 2), "\n")
cat("Difference (tall - short): $", round(diff_means, 2), "\n")

# 95% CI for difference in means 
t_test <- t.test(tall, short, var.equal = FALSE)  # Welch's t-test
print(t_test)