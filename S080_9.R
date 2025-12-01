
install.packages("stringr")
install.packages("tidyr")
install.packages("dplyr")
library(stringr)
library(tidyr)
library(dplyr)

file_path <- "C:/Users/info/Downloads/sales_data_sample - sales_data_sample.csv"
sales_data <- read.csv(file_path, stringsAsFactors = FALSE)

print("~~ Original Dataset (First 5 rows) ~~")
print(head(sales_data, 5))

sales_data$ProdLine_Code <- str_sub(sales_data$PRODUCTCODE, 1, 4)

sales_data$ProdCode_Year <- str_sub(sales_data$PRODUCTCODE, -4, -1)

print("~~ After str_sub() ~~")
print(sales_data %>% select(PRODUCTCODE, ProdLine_Code, ProdCode_Year) %>% head())

split_matrix <- str_split(sales_data$PRODUCTLINE, " - ", simplify = TRUE)

if(ncol(split_matrix) > 1){
  sales_data$Main_ProductLine <- split_matrix[,1]
  sales_data$Sub_ProductLine  <- split_matrix[,2]
} else {
  sales_data$Main_ProductLine <- sales_data$PRODUCTLINE
  sales_data$Sub_ProductLine  <- NA
}

print("~~ After str_split() ~~")
print(sales_data %>% select(PRODUCTLINE, Main_ProductLine, Sub_ProductLine) %>% head())

tidy_sales <- sales_data %>%
  separate(PRODUCTCODE, into = c("Dept", "Prod_ID", "Prod_Year"), sep = "-", fill = "right", remove = FALSE)

print("~~ After separate() ~~")
print(tidy_sales %>% select(PRODUCTCODE, Dept, Prod_ID, Prod_Year) %>% head())
print("Nishita Giri S080")
