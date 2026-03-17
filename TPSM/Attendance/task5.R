# -----------------------------
# 1. One-sample t-test
# -----------------------------
# Sample information
sample_mean <- 82.5
sample_sd <- 8.4
n <- 25
population_mean <- 80

# Simulate sample data based on given mean and sd
set.seed(1)
sample_data <- rnorm(n, mean = sample_mean, sd = sample_sd)

# One-sample t-test
t_test_result <- t.test(sample_data, mu = population_mean)
print("One Sample t-test Result:")
print(t_test_result)


# -----------------------------
# 2. Two-sample Z-test (population SD known)
# -----------------------------
mean1 <- 170
mean2 <- 175
sd1 <- 12
sd2 <- 10
n1 <- 50
n2 <- 60

# Z statistic calculation
z <- (mean1 - mean2) / sqrt((sd1^2 / n1) + (sd2^2 / n2))

# p-value
p_value <- 2 * (1 - pnorm(abs(z)))

print("Two Sample Z-test Result:")
print(paste("Z value =", z))
print(paste("P-value =", p_value))


# -----------------------------
# 3. ANOVA Test
# -----------------------------
group_1 <- c(72, 74, 78, 69, 75)
group_2 <- c(80, 82, 85, 79, 81)
group_3 <- c(85, 88, 90, 84, 87)

scores <- c(group_1, group_2, group_3)
groups <- factor(rep(c("Method1","Method2","Method3"), each=5))

anova_result <- aov(scores ~ groups)

print("ANOVA Result:")
summary(anova_result)


# -----------------------------
# 4. Correlation Analysis
# -----------------------------
hours_studied <- c(1, 2, 3, 4, 5)
exam_scores <- c(55, 60, 65, 70, 75)

correlation_result <- cor.test(hours_studied, exam_scores)

print("Correlation Test Result:")
print(correlation_result)


# -----------------------------
# 5. Normality Test (Shapiro-Wilk)
# -----------------------------
set.seed(2)
data_sample <- rnorm(50, mean = 50, sd = 10)

normality_test <- shapiro.test(data_sample)

print("Normality Test Result:")
print(normality_test)