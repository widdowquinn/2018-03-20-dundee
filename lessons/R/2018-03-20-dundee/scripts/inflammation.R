# Preliminary analysis of inflammation in arthritis patients

# Load data (no headers, CSV)
data <- read.csv("data/data/inflammation-02.csv", header = FALSE)

# Calculate average inflammation by patient and day
avg_inf_patient <- apply(data, 1, mean)
avg_inf_day <- apply(data, 2, mean)

# Plot data summaries
# Average inflammation by patient
plot(avg_inf_patient)

# Average inflammation by day
plot(avg_inf_day)

# Maximum inflammation by day
max_inf_day <- apply(data, 2, max)
plot(max_inf_day)

# Minimum inflammation by day
plot(apply(data, 2, min))

# Show histogram of average patient inflammation
hist(avg_inf_patient, breaks=seq(5, 8, by=0.2))

# Standard deviation of inflammation by day
plot(apply(data, 2, sd))

# Histogram average inflammation by day
hist(avg_inf_day, breaks=seq(0, 15, by=1))
