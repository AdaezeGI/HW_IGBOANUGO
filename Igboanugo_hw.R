# Generate 100 random normal numbers with mean = 25 and standard deviation = 1
random_numbers <- rnorm(100, mean = 25, sd = 1)

# Print the random numbers to verify
print(random_numbers)

# Compute the mean of the 100 random numbers
mean_value <- mean(random_numbers)

# Print the mean value to verify
print(mean_value)
# Compute the standard deviation of the 100 random numbers
sd_value <- sd(random_numbers)

# Print the standard deviation to verify
print(sd_value)

# Print a message showing the mean and standard deviation
print(paste("The Mean is", mean_value, "and the Standard Deviation is", sd_value))


