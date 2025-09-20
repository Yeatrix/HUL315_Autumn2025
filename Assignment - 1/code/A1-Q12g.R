vars <- c("height","educ","age","sex","race","occupation","region")
cor(df[, c("height","educ","age")], use="complete.obs")

# For categorical vars: mean height by group
aggregate(height ~ sex, data=df, FUN=function(x) c(mean=mean(x,na.rm=TRUE), n=length(x)))
aggregate(height ~ race, data=df, FUN=function(x) c(mean=mean(x,na.rm=TRUE), n=length(x)))
aggregate(height ~ occupation, data=df, FUN=function(x) c(mean=mean(x,na.rm=TRUE), n=length(x)))


# simple regression
m1 <- lm(earnings ~ height, data=df)
summary(m1)

# regression with plausible controls
m2 <- lm(earnings ~ height + educ + age + I(age^2) + sex + factor(race) + factor(occupation) + factor(region), data=df)
summary(m2)

# compare coefficients
coef(m1)["height"]
coef(m2)["height"]


# regress height on controls
hctl <- lm(height ~ educ + age + I(age^2) + sex + factor(race) + factor(occupation) + factor(region), data=df)
summary(hctl)

# R^2 from this regression shows how much of height is explained by observables
summary(hctl)$r.squared


delta_pct <- (coef(m1)["height"] - coef(m2)["height"]) / coef(m1)["height"] * 100
cat("Percent change when adding controls:", round(delta_pct,1), "%\n")


# requires family id column 'fam_id'
m_fe <- lm(earnings ~ height + factor(fam_id) + other_controls, data=df)  # or use plm/lfe


