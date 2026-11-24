# 05-intro-r.R -- Session 5: Introduction to R (R Lab 0)
# The code shown on the slides, with the answers to the ungraded "Your turn" tasks.
# The full lab is R Labs/bam-probstats-labs/Lab_00_Intro_R/lab.Rmd. Run from that lab folder
# (open Lab_00_Intro_R.Rproj) so that data/mtcars.csv is found.

# Vectors -------------------------------------------------------------------
x <- c(3, 7, 1, 9, 4)
x[x > 3]; mean(x); sd(x)                  # 7 9 4; 4.8; 3.19
y <- seq(2, 20, by = 2)
mean(y); var(y); mean(y > 10)             # 11; 36.67; 0.5

# Data frames -----------------------------------------------------------------
cars_df <- read.csv("data/mtcars.csv")
cars_df$am  <- factor(cars_df$am, labels = c("automatic", "manual"))
cars_df$cyl <- factor(cars_df$cyl)
table(cars_df$cyl, cars_df$am)
tapply(cars_df$mpg, cars_df$am, mean)     # 17.1 automatic, 24.4 manual
prop.table(table(cars_df$cyl, cars_df$am), margin = 1)   # P(manual | cyl)

# Functions -------------------------------------------------------------------
standardize <- function(x) (x - mean(x)) / sd(x)
z <- standardize(cars_df$mpg)
round(c(mean(z), sd(z)), 10)              # 0 and 1

# Simulation ------------------------------------------------------------------
set.seed(2027)
two <- sample(1:6, 10000, replace = TRUE) + sample(1:6, 10000, replace = TRUE)
mean(two == 7); 6/36                      # 0.1675 vs 0.1667

set.seed(2027)
mean(replicate(10000, any(sample(1:6, 4, replace = TRUE) == 6)))   # 0.5115
1 - (5/6)^4                                                         # 0.5177
# how much does the estimate move with the seed?
sapply(1:5, function(s) {
  set.seed(s)
  mean(replicate(10000, any(sample(1:6, 4, replace = TRUE) == 6)))
})                                         # 0.515 0.521 0.514 0.510 0.517
