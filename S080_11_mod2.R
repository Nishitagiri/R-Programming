
library(ggplot2)

# Read dataset (C:/Users/info/Downloads/heart_failure_clinical_records_dataset.csv)
csv <- read.csv("C:/Users/info/Downloads/heart_failure_clinical_records_dataset.csv")

ggplot(sv, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "pink", color = "purple") +
  labs(title = "Histogram of Age S080", x = "Age", y = "Frequency") +
  theme_minimal()

ggplot(sv, aes(x = factor(DEATH_EVENT), y = serum_creatinine)) +
  geom_boxplot(fill = "grey") +
  labs(title = "Serum Creatinine by Death Event S080",
       x = "Death Event",
       y = "Serum Creatinine") +
  theme_minimal()
