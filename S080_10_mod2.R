#install and load ggplot2
install.packages("ggplot2")
library(ggplot2)

#data
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


ggplot(df, aes(x = Height, y = Weight, color = Gender)) +
  geom_point(size = 3) +
  labs(
    title = "Scatter Plot: Height vs Weight S080",
    x = "Height (cm)",
    y = "Weight (kg)"
  ) +
  theme_minimal()


gender_count <- as.data.frame(table(df$Gender))
colnames(gender_count) <- c("Gender", "Count")

ggplot(gender_count, aes(x = "", y = Count, fill = Gender)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(
    title = "Pie Chart: Gender Distribution S080"
  ) +
  theme_void()


range_data <- aggregate(Weight ~ Gender, df, 
                        function(x) c(min = min(x), max = max(x)))
range_data <- do.call(data.frame, range_data)
colnames(range_data) <- c("Gender", "MinWeight", "MaxWeight")

ggplot(range_data, aes(x = Gender)) +
  geom_linerange(aes(ymin = MinWeight, ymax = MaxWeight),
                 color = "lavender", size = 2) +
  geom_point(aes(y = MinWeight), color = "purple", size = 3) +
  geom_point(aes(y = MaxWeight), color = "pink", size = 3) +
  labs(
    title = "High–Low Chart: Weight Range by Gender S080",
    x = "Gender",
    y = "Weight (kg)"
  ) +
  theme_minimal()
