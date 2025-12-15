library(dplyr)

data2 <- read.csv(
  "C:/Users/info/Downloads/Sales Dataset.csv",
  stringsAsFactors = FALSE
)

head(data2, 10)

table(data2$Category)
table(data2$`Sub-Category`)
table(data2$PaymentMode)
table(data2$State)

count(data2, Category)

count(data2, PaymentMode)

count(data2, State)

print("Nishita Giri S080")
