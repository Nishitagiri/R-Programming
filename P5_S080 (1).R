library(dplyr)

olympics <- read.csv("~/Nishita/Athens 2004 Olympics Nations Medals.csv")

head(olympics)
colnames(olympics)

olympics_sorted_gold <- olympics |>
  arrange(Gold)

head(olympics_sorted_gold, 5)

olympics_sorted_total_desc <- olympics |>
  arrange(desc(Total))

head(olympics_sorted_total_desc, 5)


olympics_multi_sort <- olympics |>
  arrange(Gold, desc(Silver))

head(olympics_multi_sort, 10)

olympics_high_gold <- olympics |>
  filter(Gold > 20) |>
  arrange(Total)

olympics_high_gold |>
  select(NOC, Gold, Total) |>
  head(5)
