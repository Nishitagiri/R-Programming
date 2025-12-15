
library(dplyr)
library(tidyr)

df <- read.csv("fertility_rate.csv", na.strings = c("", "NA"))

df <- df %>%
  mutate(ID = row_number()) %>%
  select(ID, Country, Year, Fertility_Rate, Population)

print("--- 1. Original Wide Data ---")
print(head(df))

long_df <- df %>%
  pivot_longer(
    cols = c(Fertility_Rate, Population),
    names_to = "Metric",
    values_to = "Value"
  )

print("--- 2. Long Format (pivot_longer) ---")
print(head(long_df, 6))

wide_df <- long_df %>%
  pivot_wider(
    names_from = Metric,
    values_from = Value
  )

print("--- 3. Wide Format (pivot_wider) ---")
print(head(wide_df))


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

