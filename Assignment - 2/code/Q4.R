# i have kept the healthcare.csv in data folder. Loading the data into healthcare_data dataframe
healthcare_data <- read.csv("../data/healthcare.csv")

#estimation of the equation 3
model_in_eq_3 <- lm(HHNINC ~ EDUC + UNIV + WORKING + BLUEC + SELF, data = healthcare_data)
print(summary(model_in_eq_3))

beta_1_model_3 <- coef(model_in_eq_3)["EDUC"]

#estimation of the equation 4
model_in_eq_4 <- lm(HHNINC ~ UNIV + WORKING + BLUEC + SELF, data = healthcare_data)
hhninc_res <- resid(model_in_eq_4)
print(summary(model_in_eq_4))

#estimation of the equation 5
model_in_eq_5 <- lm(EDUC ~ UNIV + WORKING + BLUEC + SELF, data = healthcare_data)
educ_res <- resid(model_in_eq_5)
print(summary(model_in_eq_5))

#estimation of the equation 6
model_in_eq_6 <- lm(hhninc_res ~ educ_res)
print(summary(model_in_eq_6))

beta_1_model_6 <- coef(model_in_eq_6)["educ_res"]

#display the results.
cat("\n--- Coefficient Comparison ---\n")
cat("Coefficient for 'EDUC' from Eq. (3):    ", beta_1_model_3, "\n")
cat("Coefficient for 'educ_res' from Eq. (6):", beta_1_model_6, "\n")