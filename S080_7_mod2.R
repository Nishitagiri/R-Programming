# One-Way ANOVA using CSV data

# Library import
library(stats)

# Read the CSV file
olympic_data <- read.csv("~/Nishita/olympic_athletes.csv", stringsAsFactors = TRUE)

# View data structure
str(olympic_data)

# Convert grouping variable to factor (if not already)
olympic_data$first_game <- as.factor(olympic_data$first_game)

# Perform One-Way ANOVA
anova_model <- aov(games_participations ~ first_game, data = olympic_data)

# Display ANOVA result
summary(anova_model)
print("Nishita Giri S080")
