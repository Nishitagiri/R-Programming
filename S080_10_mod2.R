
install.packages("ggplot2")   
library(ggplot2)

df <- data.frame(
  Gender = c("Male","Male","Male","Male","Male","Male","Male","Male","Male",
             "Female","Male","Female","Male","Female","Female","Female","Female",
             "Male","Female","Male","Female"),
  
  Height = c(161,179,172,153,165,172,182,179,142,
             158,194,178,155,151,181,147,142,165,146,157,173),
  
  Weight = c(89,127,139,104,68,92,108,130,71,
             153,108,107,57,64,80,126,159,155,104,56,82),
  
  Index = c(4,4,5,5,2,4,4,5,4,
            5,3,4,2,3,2,5,5,5,5,2,2)
)

print(df)

ggplot(df, aes(x = Gender, fill = Gender)) +
  geom_bar() +
  labs(
    title = "Gender Distribution S080",
    x = "Gender",
    y = "Count"
  ) +
  theme_minimal()

ggplot(df, aes(x = Height)) +
  geom_histogram(binwidth = 5, fill = "pink", color = "brown") +
  labs(
    title = "Height Distribution S080",
    x = "Height (cm)",
    y = "Frequency"
  ) +
  theme_minimal()

ggplot(df, aes(x = Height, y = Weight, color = Gender)) +
  geom_point(size = 3) +
  labs(
    title = "Height vs Weight S080",
    x = "Height (cm)",
    y = "Weight (kg)"
  ) +
  theme_minimal()

ggplot(df, aes(x = Gender, y = Weight, fill = Gender)) +
  geom_boxplot() +
  labs(
    title = "Weight Comparison by Gender S080",
    x = "Gender",
    y = "Weight (kg)" 
  ) +
  theme_minimal()

ggplot(df, aes(x = factor(Index), y = Weight)) +
  stat_summary(fun = mean, geom = "bar", fill = "purple") +
  labs(
    title = "Average Weight by Index S080",
    x = "Index",
    y = "Average Weight"
  ) +
  theme_minimal()
