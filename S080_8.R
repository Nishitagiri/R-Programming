library(dplyr)
library(tidyr)

sleep_df <- read.csv(
  "C:/Users/info/Downloads/College basketball.csv",
  stringsAsFactors = TRUE,
  na.strings = c("", "NA")
)

cat("\n~~ 1) Original Data (First 6 Rows) ~~\n")
print(head(sleep_df))

cat("\n~~ Count of Missing Values per Column ~~\n")
print(colSums(is.na(sleep_df)))

clean_omit <- na.omit(sleep_df)

cat("\n~~ 2) Data after na.omit() ~~\n")
cat("Original rows:", nrow(sleep_df), "\n")
cat("Rows remaining:", nrow(clean_omit), "\n")
print(head(clean_omit))

clean_replace <- sleep_df %>%
  
  mutate(across(where(is.factor), as.character)) %>%
  
  mutate(across(where(is.numeric), ~ replace_na(., mean(., na.rm = TRUE)))) %>%
  
  mutate(across(where(is.character), ~ replace_na(., "UNKNOWN"))) %>%
  
  mutate(across(where(is.character), as.factor))

cat("\n~~ 3) Data after Replacing Missing Values ~~\n")
print(head(clean_replace))

cat("\n~~ Remaining NA After Cleaning ~~\n")
print(colSums(is.na(clean_replace)))

print("Nishita Giri S080")
