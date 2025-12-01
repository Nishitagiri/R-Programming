library(dplyr)


auto_df <- read.csv("C:/Users/info/Downloads/Auto Sales data.csv")
employee_df <- read.csv("C:/Users/info/Downloads/employee_performance_dataset.csv")


auto_small <- auto_df %>% 
  select(QUANTITYORDERED, SALES, STATUS)

employee_small <- employee_df %>% 
  select(technical_score, communication_score, management_score)


combined_data <- bind_rows(auto_small, employee_small)


print("~~ Auto Sales Data ~~")
print(auto_small)

print("~~ Employee Data ~~")
print(employee_small)

print("~~ Combined Data ~~")
print(combined_data)

write.csv(combined_data,
          "C:/Users/info/Downloads/combined_data.csv",
          row.names = FALSE)
print("Nishita Giri S080")
