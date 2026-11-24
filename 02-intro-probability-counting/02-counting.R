# 02-counting.R -- Session 2: check of every number in the deck and the teaching notes
# Run from anywhere: Rscript 02-counting.R

# Axioms and inclusion-exclusion
0.60 + 0.45 - 0.25                 # news readers: P(A or B) = 0.80
1 - 0.80                           # neither = 0.20
0.60 - 0.25                        # only A = 0.35
0.5 + 0.4 - 0.7                    # Your turn: P(A and B) = 0.2
0.5 - 0.2                          # A only = 0.3
1 - 0.7                            # neither = 0.3
0.3 + 0.5; 1 - 0.8                 # exit ticket 1: 0.8 and 0.2

# Counting
prod(8:6)                          # 336 ordered officers
choose(8, 3)                       # 56 committees
choose(52, 5)                      # 2,598,960 hands
prod(10:8)                         # 720 podiums
factorial(10) / (factorial(3) * factorial(3) * factorial(2))  # 50,400 words (STATISTICS)
3 * 4 * 2; 10^4                    # 24 meals; 10,000 PINs
factorial(5); factorial(10)        # 120; 3,628,800
choose(49, 6); 1 / choose(49, 6)   # 13,983,816; 7.15e-08
choose(6, 2) * choose(4, 1) / choose(10, 3)   # 0.5
choose(4, 2) / choose(52, 2); 1 / 221          # 0.0045
1 - choose(48, 2) / choose(52, 2); 33 / 221    # 0.149
choose(48, 2); choose(52, 2)                   # 1128; 1326

# Birthday problem
pbirthday(23)                                  # 0.507
1 - prod((365 - 22):365 / 365)                 # 0.507
qbirthday(0.5)                                 # 23
choose(23, 2)                                  # 253 pairs
1 - prod((365 - 56):365 / 365)                 # n = 57: 0.99
which(sapply(1:60, function(n) 1 - prod((365 - n + 1):365 / 365)) > 0.9)[1]  # 41

# Exit ticket 2: seatings of 4 where Ana and Ben sit together
factorial(4); factorial(3) * 2                 # 24; 12; probability 12/24 = 0.5
set.seed(1)
mean(replicate(1e5, { s <- sample(4); abs(which(s == 1) - which(s == 2)) == 1 }))   # about 0.5

# Frequentist picture (page 6): proportion of heads in 1000 tosses
set.seed(1); x <- rbinom(1000, 1, 0.5); tail(cumsum(x) / seq_along(x), 1)

# Table: with replacement, order does not matter
choose(5 + 3 - 1, 3)                           # e.g. 3 scoops from 5 flavours: 35
