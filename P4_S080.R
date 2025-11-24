install.packages("dplyr")
library(dplyr)
library(readr)

college <- read_csv("~/Nishita/data.csv")

head(college)


high_exp_subset <- subset(college, expend > 50000)

cat("Number of high-expenditure colleges:", nrow(high_exp_subset), "\n")
summary(high_exp_subset$expend)



high_exp_high_grad <- subset(college, expend > 50000 & grad_rate > 80)

cat("High expenditure & high graduation rate:", nrow(high_exp_high_grad), "\n")
head(high_exp_high_grad)



special_colleges <- subset(college, private == "Yes" | top10perc > 50)

cat("Special colleges (Private OR top10perc > 50):", nrow(special_colleges), "\n")
head(special_colleges)


low_outstate <- college |>
  filter(outstate < 10000)

cat("Number of low outstate tuition colleges:", nrow(low_outstate), "\n")
summary(low_outstate$outstate)



large_undergrad <- college |>
  filter(f_undergrad > 5000)

cat("Large undergrad colleges (>5000 students):", nrow(large_undergrad), "\n")
head(large_undergrad)



private_or_public <- college |>
  filter(private %in% c("Yes", "No"))

cat("Total colleges:", nrow(private_or_public), "\n")
table(private_or_public$private)
