# 03-conditional-probability.R -- Session 3: Conditional Probability and Bayes' Theorem
# The examples from the slides, checked exactly and by simulation.
# Run line by line in RStudio or Posit Cloud.

# 1. Online shop: conditional probabilities from a table -------------------
shop <- matrix(c(30, 570, 40, 360), nrow = 2, byrow = TRUE,
               dimnames = list(device = c("mobile", "desktop"), buy = c("yes", "no")))
shop
prop.table(shop, margin = 1)     # rows: P(buy | device) -> 0.05 and 0.10
prop.table(shop, margin = 2)     # columns: P(device | buy) -> mobile 0.43

# 2. Chain rule: three red balls from 4 red + 6 blue ----------------------
4/10 * 3/9 * 2/8                 # 1/30
choose(4, 3) / choose(10, 3)     # same answer by counting

set.seed(3)
urn <- rep(c("R", "B"), c(4, 6))
mean(replicate(1e5, all(sample(urn, 3) == "R")))   # about 0.033

# 3. Independence: at least one detection in n inspections ----------------
n <- 1:6
round(1 - 0.3^n, 4)              # first n with >= 0.99 is n = 4
0.95^3                           # series system works: 0.857
1 - 0.05^3                       # parallel system works: 0.999875

# 4. Total probability and Bayes: spam filter ------------------------------
p_free <- 0.25 * 0.4 + 0.02 * 0.6
p_free                           # 0.112
0.25 * 0.4 / p_free              # P(spam | "free") = 0.893

# 5. Medical test ----------------------------------------------------------
bayes_test <- function(prev, sens = 0.99, fpr = 0.05) {
  sens * prev / (sens * prev + fpr * (1 - prev))
}
bayes_test(0.01)                 # one positive: 0.167
bayes_test(bayes_test(0.01))     # two positives: 0.798
bayes_test(0.10)                 # prevalence 10%: 0.688
bayes_test(0.01, fpr = 0.01)     # better test: 0.5

# simulation: 100,000 people
set.seed(3)
N <- 1e5
sick <- runif(N) < 0.01
pos1 <- ifelse(sick, runif(N) < 0.99, runif(N) < 0.05)
pos2 <- ifelse(sick, runif(N) < 0.99, runif(N) < 0.05)
mean(sick[pos1])                 # about 0.17
mean(sick[pos1 & pos2])          # about 0.80
# the tests are NOT independent unconditionally:
mean(pos2)                       # about 0.059
mean(pos2[pos1])                 # about 0.21

# 6. Monty Hall ------------------------------------------------------------
set.seed(3)
car  <- sample(1:3, N, replace = TRUE)
pick <- sample(1:3, N, replace = TRUE)
mean(car == pick)                # stay wins about 1/3
mean(car != pick)                # switch wins about 2/3
