library(ggplot2)

data <- read.csv("~/Nishita/Ecommerce_Delivery_Analytics_New.csv", check.names = FALSE)

data_subset <- data[1:10, ]

model <- lm(`Service Rating` ~ `Delivery Time (Minutes)`, data = data_subset)

summary(model)

ggplot(data_subset, aes(x = `Delivery Time (Minutes)`, y = `Service Rating`)) +
  geom_point(color = "orchid", size = 4, alpha = 0.8) +
  geom_smooth(method = "lm", color = "purple4", fill = "mediumpurple1", alpha = 0.2) +
  labs(
    title = "Linear Regression: Delivery Time vs Service Rating - Nishita Giri S080",
    subtitle = paste("R-squared:", round(summary(model)$r.squared, 3), "(First 10 Rows)"),
    x = "Delivery Time (Minutes)",
    y = "Service Rating"
  ) +
  theme_minimal()