
library(dplyr)
library(tidyr)

athletes <- read.csv("C:/Users/info/Downloads/athlete_events.csv", 
                     na.strings = c("", "NA"))

athletes_clean <- athletes %>%
  mutate(
    Age = replace_na(Age, median(Age, na.rm = TRUE)),
    Height = replace_na(Height, median(Height, na.rm = TRUE)),
    Weight = replace_na(Weight, median(Weight, na.rm = TRUE)),
    Medal = replace_na(Medal, "None")
  )

print("~~ Cleaned Baseline Data ~~")
print(head(athletes_clean))

athletes_calc <- athletes_clean %>%
  mutate(
    Height_m = Height / 100,                  
    BMI = round(Weight / (Height_m^2), 1)     
  )

print("~~ Arithmetic Results (BMI) ~~")
print(athletes_calc %>% select(Name, Height, Weight, BMI))

athletes_logic <- athletes_clean %>%
  mutate(
    Age_Category = ifelse(Age < 25, "Young", 
                          ifelse(Age <= 30, "Prime", "Veteran")),
    Medal_Status = ifelse(Medal != "None", "Medalist", "Non-Medalist")
  )

print("~~ Logic Results ~~")
print(athletes_logic %>% select(Name, Age, Age_Category, Medal, Medal_Status))

athletes_text <- athletes_clean %>%
  mutate(
    Athlete_Summary = paste(Name, "from", Team, "plays", Sport, 
                            "and won", Medal)
  )

print("~~ Text Transformation ~~")
print(head(athletes_text$Athlete_Summary))

final_athletes <- athletes_clean %>%
  mutate(
    Height_m = Height / 100,
    BMI = round(Weight / (Height_m^2), 1),
    Age_Category = ifelse(Age < 25, "Young", D
                          ifelse(Age <= 30, "Prime", "Veteran")),
    Medal_Status = ifelse(Medal != "None", "Medalist", "Non-Medalist"),
    Athlete_Summary = paste0(Name, " (", Team, ") - ", Sport, 
                             " | BMI: ", BMI, " | Medal: ", Medal)
  )

print("~~ Final Combined Dataset ~~")
print(head(final_athletes))
print("Nishita Giri S080")
