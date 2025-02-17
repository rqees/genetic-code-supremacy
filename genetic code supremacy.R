# Purpose: To find the mean of the sum of the pairwise distances between all
# codons and their codon neighbors of 1000 realistic, random genetic codes
# for CSB195 Report #1.

# Version: 1.0
# Date:    2024-10-13
# Author:  Raees Kabir (r.kabir@mail.utoronto.ca)
#
# Versions:
#   1.0

# Preconditions:
#    Functions aaSim(), neighCodons(), and rGC() are defined in CSB195/R via
#    aaSim.R, neighCodons.R, and rGC.R respectively.

# ==============================================================================

# PART 1: Generation and Evaluating Genetic Codes


evaluateCode <- function(thisCode) {
  sumDist <- 0                            # Initialize the sum of distances

  for (codonX in names(thisCode)) {       # For each codon
    aaX <- thisCode[codonX]               # Get the encoded amino acid

    for (codonY in neighCodons(codonX)) { # For all nine neighbors
      aaY <- thisCode[codonY]             # Get the encoded amino acid
      dist <- aaSim(aaX, aaY)             # Compute distance in feature space
      sumDist <- sumDist + dist           # Add to the sum of distances
    }
  }

  return(sumDist)
}

# Function to generate and evaluate 1000 random genetic codes
evaluateRandomCodes <- function(numCodes = 1000, seed = 1011304214) {
  results <- data.frame(ID = 1:numCodes, SumDistances = numeric(numCodes))

  for (i in 1:numCodes) {
    randomCode <- rGC(seed = seed + i)    # Generate a random genetic code
    sumDist <- evaluateCode(randomCode)   # Evaluate the code
    results$SumDistances[i] <- sumDist    # Store the sum of distances
  }

  write.csv(results, "raees_report1_code_evaluations_v1.0.csv", row.names = FALSE)

  return(results)
}

# Call the function to evaluate 1000 random genetic codes
evaluateRandomCodes()




# PART 2: Plotting Histogram

# Load the data from the CSV file
results <- read.csv("raees_report1_code_evaluations_v1.0.csv")

# Plot the histogram
hist(results$SumDistances,
     main = "Sum of Distances of Randomized Genetic Codes",
     xlab = "Sum of Distances",
     ylab = "Frequency",
     col = "lightblue",
     border = "black",
     breaks = 30,
     prob = TRUE)
# Fit the normal distribution using mean and sd
mean_dist <- mean(results$SumDistances)
sd_dist <- sd(results$SumDistances)

# Generate a sequence of x values (for the normal curve)
x_values <- seq(min(results$SumDistances), max(results$SumDistances), length = 100)

# Calculate the corresponding y values (normal distribution densities)
y_values <- dnorm(x_values, mean = mean_dist, sd = sd_dist)

# Overlay the normal distribution curve
lines(x_values, y_values, col = "red", lwd = 2)




# PART 3: Calculate Results

# Calculate the mean and standard deviation of the sum distances
mean_dist <- mean(results$SumDistances)
sd_dist <- sd(results$SumDistances)

# Observed value
observed_value <- 1272.931

# Calculate the z-score
z_score <- (observed_value - mean_dist) / sd_dist

# Calculate the p-value
p_value <- 2 * pnorm(-abs(z_score))

# Output the results
cat("Mean of Sum Distances:", mean_dist, "\n")
cat("Standard Deviation of Sum Distances:", sd_dist, "\n")
cat("Z-Score:", z_score, "\n")
cat("P-Value:", p_value, "\n")

