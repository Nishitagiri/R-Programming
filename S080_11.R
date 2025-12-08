# ==============================================================================
# R Script: Reshaping Data with pivot_longer() and pivot_wider()
# Dataset: Fertility Rate Data
# ==============================================================================

library(dplyr)
library(tidyr)

# ==============================================================================
# 1. SETUP: Import Data
# ==============================================================================

# Read dataset
df <- read.csv("fertility_rate.csv", na.strings = c("", "NA"))

# Assume dataset structure like:
# Country | Year | Fertility_Rate | Population

df <- df %>%
  mutate(ID = row_number()) %>%
  select(ID, Country, Year, Fertility_Rate, Population)

print("--- 1. Original Wide Data ---")
print(head(df))

# ==============================================================================
# 2. PIVOT_LONGER (Wide to Long)
# ==============================================================================

# Combine Fertility_Rate and Population into a single column
long_df <- df %>%
  pivot_longer(
    cols = c(Fertility_Rate, Population),
    names_to = "Metric",
    values_to = "Value"
  )

print("--- 2. Long Format (pivot_longer) ---")
print(head(long_df, 6))

# ==============================================================================
# 3. PIVOT_WIDER (Long to Wide)
# ==============================================================================

# Convert long data back to wide format
wide_df <- long_df %>%
  pivot_wider(
    names_from = Metric,
    values_from = Value
  )

print("--- 3. Wide Format (pivot_wider) ---")
print(head(wide_df))

# ==============================================================================
# 4. ADVANCED EXAMPLE (Year-wise Reporting Table)
# ==============================================================================

# Create a table where each Year becomes a column
# and values are Fertility Rates for each Country

df_clean <- df %>%
  mutate(Country = ifelse(is.na(Country), "Unknown", Country))

year_pivot <- df_clean %>%
  select(Country, Year, Fertility_Rate) %>%
  pivot_wider(
    names_from = Year,
    values_from = Fertility_Rate
  )

print("--- 4. Year-wise Fertility Rate Table ---")
print(head(year_pivot))
