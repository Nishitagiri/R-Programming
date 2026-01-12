library(ggplot2)

#for reading the dataset
csv <- read.csv("C:/Users/info/Downloads/heart_failure_clinical_records_dataset.csv")


ggplot(csv, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "lightpink", color = "mistyrose") +
  labs(
    title = "Histogram of Age S080",
    x = "Age",
    y = "Frequency"
  ) +
  theme_minimal()


ggplot(csv, aes(x = factor(DEATH_EVENT), y = serum_creatinine)) +
  geom_boxplot(fill = "lavender") +
  labs(
    title = "Serum Creatinine by Death Event S080",
    x = "Death Event",
    y = "Serum Creatinine"
  ) +
  theme_minimal()
