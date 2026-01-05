
library(stats)

df <- read.csv("~/Nishita/test_data.csv")

head(df)

#create table (Sex vs Survived)
chi_table <- table(df$Sex, df$Survived)

#display table
chi_table

#perform Chi-square test
chisq.test(chi_table)
print("Nishita Giri S080")

