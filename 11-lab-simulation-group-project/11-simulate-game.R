# Function to simulate one round of the game
simulate_game <- function() {
  # Each player rolls a die
  roll_A <- sample(1:6, 1)
  roll_B <- sample(1:6, 1)
  
  # Determine the largest roll
  largest_roll <- max(roll_A, roll_B)
  
  # Decide the winner based on the largest roll
  if (largest_roll <= 4) {
    return("Player A wins")
  } else {
    return("Player B wins")
  }
}

# Simulate the game N times
N <- 1000
results <- replicate(N, simulate_game())

# Display the winners of each game
# results

table(results)/N

