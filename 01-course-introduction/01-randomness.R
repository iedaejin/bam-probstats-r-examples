# 01-randomness.R -- Session 1: Introduction to Probability and Statistics
# The three examples from the slides. Run line by line in RStudio or Posit Cloud.

# 1. Longest run in 20 fair coin tosses ----------------------------------
x <- sample(c("H", "T"), size = 20, replace = TRUE)
x
rle(x)                       # runs: lengths and values
max(rle(x)$lengths)          # longest run

set.seed(1)
L <- replicate(1e5, max(rle(sample(c("H", "T"), 20, replace = TRUE))$lengths))
table(L) / length(L)         # distribution of the longest run
mean(L <= 3)                 # about 0.23: invented sequences are often this short
mean(L >= 4)                 # about 0.77

# 2. One coin, two questions ---------------------------------------------
# Probability: a fair coin, 100 tosses. P(60 or more heads)?
1 - pbinom(59, size = 100, prob = 0.5)   # 0.028
# Statistics: we saw 60 heads. A fair coin does this less than 3% of the time.

# 3. Monte Carlo estimate of pi ------------------------------------------
set.seed(1)
n <- 1000
u <- runif(n); v <- runif(n)
inside <- u^2 + v^2 <= 1
sum(inside)                  # 787
4 * mean(inside)             # 3.148

plot(u, v, col = ifelse(inside, "navy", "red"), pch = 20, asp = 1)
curve(sqrt(1 - x^2), from = -1, to = 1, add = TRUE, lwd = 2)

# more points, better estimate (error shrinks like 1/sqrt(n))
for (n in c(100, 1000, 1e4, 1e5, 1e6)) {
  cat(n, "points:", 4 * mean(runif(n)^2 + runif(n)^2 <= 1), "\n")
}

# 4. Look at the data before summarising it ------------------------------
mean(faithful$waiting)       # 70.9 minutes
hist(faithful$waiting, breaks = 20, main = "Old Faithful: waiting times",
     xlab = "Minutes to the next eruption")
abline(v = mean(faithful$waiting), col = "red", lwd = 2, lty = 2)
