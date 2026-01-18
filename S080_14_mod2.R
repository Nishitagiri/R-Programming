# 1. Load the required library
library(ggplot2)

# 2. Read the dataset
data <- read.csv("~/Nishita/Karate_World_Championships.csv")

# 3. Create a binary outcome variable for Logistic Regression
# We'll define 'High_Events' as 1 if Events > 10, and 0 otherwise
data$High_Events <- ifelse(data$Events > 10, 1, 0)

# 4. Use only the first 10 rows as requested
data_subset <- data[1:10, ]

# 5. Perform Logistic Regression using glm()
# family = "binomial" is what makes it a logistic regression
model <- glm(High_Events ~ Year, data = data_subset, family = binomial)

# 6. Display the summary of the model
summary(model)

# 7. Plotting the Logistic Regression with Purple Shades
ggplot(data_subset, aes(x = Year, y = High_Events)) +
  # Actual data points in orchid
  geom_point(color = "orchid", size = 4, alpha = 0.8) +
  # Logistic regression curve (S-curve) in dark purple
  stat_smooth(method = "glm", 
              method.args = list(family = "binomial"), 
              color = "darkorchid4", 
              fill = "plum1", 
              alpha = 0.3) +
  # Labels and Title
  labs(
    title = "Logistic Regression: Probability of High Events - Nishita Giri S080",
    subtitle = "Predicting if Events > 10 based on Year (First 10 Rows)",
    x = "Year",
    y = "Probability (High Events)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(color = "darkorchid4", face = "bold", size = 14),
    axis.title = element_text(color = "purple4", face = "bold")
  )