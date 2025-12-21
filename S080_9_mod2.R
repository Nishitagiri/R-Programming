# ============================================
# Chi-square Test using CSV file
# ============================================

# Load required library
library(stats)

# Read the CSV file
df <- read.csv("~/Nishita/test_data.csv")

# View first few rows
head(df)

# Create contingency table (Sex vs Survived)
chi_table <- table(df$Sex, df$Survived)

# Display the table
chi_table

# Perform Chi-square test
chisq.test(chi_table)
print("Nishita Giri S080")
