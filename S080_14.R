
library(dplyr)

team_stats_df <- data.frame(
  TORD        = c(18.2, 19.5, 19.5, 17.8, 16.4, 18.2),
  ORB         = c(29.1, 31.4, 31.4, 28.9, 30.2, 29.1),
  DRB         = c(70.3, 68.9, 68.9, 71.1, 69.5, 70.3),
  FTR         = c(34.2, 36.8, 36.8, 33.9, 35.1, 34.2),
  FTRD        = c(29.4, 30.1, 30.1, 28.7, 29.9, 29.4),
  X2P_O       = c(52.1, 54.8, 54.8, 51.6, 53.2, 52.1),
  X2P_D       = c(48.9, 47.3, 47.3, 49.5, 48.8, 48.9),
  X3P_O       = c(36.2, 37.9, 37.9, 35.8, 36.5, 36.2),
  X3P_D       = c(33.1, 32.4, 32.4, 33.7, 32.9, 33.1),
  ADJ_T       = c(67.4, 69.1, 69.1, 66.8, 68.2, 67.4),
  WAB         = c(3.2, 5.6, 5.6, 2.9, 4.1, 3.2),
  POSTSEASON  = c("R32", "S16", "S16", "R64", "R32", "R32"),
  SEED        = c(5, 3, 3, 10, 6, 5),
  YEAR        = c(2018, 2019, 2019, 2018, 2020, 2018)
)

print("~~ 1) Original Dataset (With Duplicates) ~~")
print(team_stats_df)

duplicates_report <- team_stats_df %>%
  group_by(
    TORD, ORB, DRB, FTR, FTRD,
    X2P_O, X2P_D, X3P_O, X3P_D,
    ADJ_T, WAB, POSTSEASON, SEED, YEAR
  ) %>%
  count() %>%
  filter(n > 1)

print("~~ 2) Duplicate Rows Identification Report ~~")
print(duplicates_report)

clean_exact <- team_stats_df %>%
  distinct()

print("~~ 3) Dataset After Removing Exact Duplicates ~~ ")
print(clean_exact)

unique_seed_year <- team_stats_df %>%
  distinct(SEED, YEAR, .keep_all = TRUE)

print("~~ 4) Unique Rows by SEED and YEAR ~~")
print(unique_seed_year)
print("Nishita Giri S080")
