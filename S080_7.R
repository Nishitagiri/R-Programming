
library(dplyr) 

olympic <- read.csv("C:/Users/info/Downloads/athlete_events.csv")

print("~~ Original Dataset (First 3 rows) ~~")
print(head(olympic, 3))

selected_cols <- olympic %>%
  select(Name, Sex, Age, Medal)

print("~~ Selected Specific Columns ~~")
print(head(selected_cols, 3))

range_cols <- olympic %>%
  select(Name:Weight)

print("~~ Selected Range of Columns (Name to Weight) ~~")
print(head(range_cols, 3))


starts_with_s <- olympic %>%
  select(starts_with("S"))

print("~~ Selected Columns Starting with 'S' ~~")
print(head(starts_with_s, 3))

dropped_one <- olympic %>%
  select(-City)

print("~~ Dataset with 'City' Dropped ~~")
print(names(dropped_one))

dropped_multiple <- olympic %>%
  select(-Sex, -Age)

print("~~ Dataset with 'Sex' and 'Age' Dropped ~~")
print(names(dropped_multiple))

dropped_range <- olympic %>%
  select(-(Height:Season))

print("~~ Dataset with Range 'Height' to 'Season' Dropped ~~")
print(names(dropped_range))

print("Nishita Giri S080")