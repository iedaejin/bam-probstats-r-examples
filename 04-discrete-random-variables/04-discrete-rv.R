# 04-discrete-rv.R -- Session 4: check of every number in the deck and the teaching notes
# Run from anywhere: Rscript 04-discrete-rv.R

# Heads in three tosses
omega <- expand.grid(t1 = c("H", "T"), t2 = c("H", "T"), t3 = c("H", "T"))
X <- rowSums(omega == "H")
table(X) / 8                           # 1/8, 3/8, 3/8, 1/8
dbinom(0:3, 3, 0.5)                    # the same: the binomial teaser
cumsum(dbinom(0:3, 3, 0.5))            # CDF: 1/8, 4/8, 7/8, 1
sum(0:3 * dbinom(0:3, 3, 0.5))         # E[X] = 1.5

# Sum of two dice
d <- expand.grid(d1 = 1:6, d2 = 1:6)
S <- d$d1 + d$d2
pS <- table(S) / 36
pS * 36                                # counts 1,2,3,4,5,6,5,4,3,2,1
(6 - abs(2:12 - 7)) / 36               # formula, same as pS
sum(pS[as.character(10:12)]); 1/6      # P(S >= 10) = 1/6
FS <- cumsum(pS); FS * 36              # F(7) = 21, F(8) = 26, F(4) = 6
FS["8"] - FS["4"]; 20/36; 5/9          # P(4 < S <= 8) = 5/9
sum(pS[as.character(5:8)])             # check by summing: 20/36
FS["7"]                                # F(7) = F(7.9) = 21/36

# Find the constant: p(x) = c (4 - x), x = 0..3
x <- 0:3; cc <- 1 / sum(4 - x); cc     # 0.1
p <- cc * (4 - x); p                   # 0.4 0.3 0.2 0.1
sum(p[x >= 2])                         # 0.3

# From the CDF to the PMF (support 1, 2, 4)
xs <- c(1, 2, 4); ps <- c(0.3, 0.4, 0.3)
Fx <- function(t) sapply(t, function(u) sum(ps[xs <= u]))
Fx(c(0, 1, 2, 3, 4))                   # 0 0.3 0.7 0.7 1
Fx(3) - Fx(1)                          # P(1 < X <= 3) = 0.4
1 - Fx(1)                              # P(X >= 2) = 0.7
Fx(2) - Fx(1.999)                      # jump at 2 = 0.4

# Exit ticket 1: tails in two tosses
dbinom(0:2, 2, 0.5)                    # 0.25 0.50 0.25
cumsum(dbinom(0:2, 2, 0.5))            # 0.25 0.75 1.00

# Simulation: the PMF as a long-run proportion
set.seed(4)
round(table(replicate(1e5, sum(sample(1:6, 2, replace = TRUE)))) / 1e5, 3)
