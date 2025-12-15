
market_data <- read.csv(
  "C:/Users/info/Downloads/synthetic_student_performance.csv",
  stringsAsFactors = FALSE
)

head(market_data)

t_test_result <- t.test(market_data$math.score, mu = 70)

print(t_test_result)
print("Nishita Giri S080")
