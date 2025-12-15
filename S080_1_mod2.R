library(psych)

data_full <- read.csv(
  "C:/Users/info/Downloads/train - train.csv",
  stringsAsFactors = FALSE
)

data1 <- data_full[, c("Order.ID", "Ship.Date", "Customer.ID")]

head(data1)
summary(data1)
describe(data1)
