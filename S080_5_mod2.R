
market_data <- read.csv(
  "C:/Users/info/Downloads/synthetic_student_performance.csv",
  stringsAsFactors = FALSE
)

head(market_data)

paired_data <- market_data[, c("math.score", "reading.score")]

head(paired_data)

paired_t_test <- t.test(
  paired_data$math.score,
  paired_data$reading.score,
  paired = TRUE
)

print(paired_t_test)
print("Nishita Giri S080")
