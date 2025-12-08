
teams_df <- data.frame(
  TEAM       = c("North Carolina", "Wisconsin", "Michigan", "Texas Tech", "Gonzaga"),
  CONF       = c("ACC", "B10", "B10", "B12", "WCC"),
  G          = c(40, 40, 40, 38, 39),
  W          = c(33, 36, 33, 31, 37),
  ADJOE      = c(123.3, 129.1, 114.4, 115.2, 117.8),
  ADJDE      = c(94.9, 93.6, 90.4, 85.2, 86.3),
  BARTHAG    = c(0.9531, 0.9758, 0.9375, 0.9696, 0.9728),
  EFG_O      = c(52.6, 54.8, 53.9, 53.5, 56.6),
  EFG_D      = c(48.1, 47.7, 47.7, 43.0, 41.1),
  TOR        = c(15.4, 12.4, 14.0, 17.7, 16.2),
  TORD       = c(18.2, 15.8, 19.5, 22.8, 17.1),
  ORB        = c(40.7, 32.1, 25.5, 27.4, 30.0),
  DRB        = c(30.0, 23.7, 24.9, 28.7, 26.2),
  FTR        = c(32.3, 36.2, 30.7, 32.9, 39.0),
  FTRD       = c(30.4, 22.4, 30.0, 36.6, 26.9),
  X2P_O      = c(53.9, 54.8, 54.7, 52.8, 56.3),
  X2P_D      = c(44.6, 44.7, 46.8, 41.9, 40.0),
  X3P_O      = c(32.7, 36.5, 35.2, 36.5, 38.2),
  X3P_D      = c(36.2, 37.5, 33.2, 29.7, 29.0),
  ADJ_T      = c(71.7, 59.3, 65.9, 67.5, 71.5),
  WAB        = c(8.6, 11.3, 6.9, 7.0, 7.7),
  POSTSEASON = c("2ND", "2ND", "2ND", "2ND", "2ND"),
  SEED       = c(1, 1, 3, 3, 1),
  YEAR       = c(2016, 2015, 2018, 2019, 2017)
)

print("~~ Data Loaded ~~")

print("~~ OUTPUT OF str() ~~")
str(teams_df)

print("~~ OUTPUT OF summary() [Before Factor Conversion] ~~")
summary(teams_df)

teams_df$TEAM       <- as.factor(teams_df$TEAM)
teams_df$CONF       <- as.factor(teams_df$CONF)
teams_df$POSTSEASON <- as.factor(teams_df$POSTSEASON)

print("~~ OUTPUT OF summary() [After Factor Conversion] ~~")
summary(teams_df)

avg_adjoe <- mean(teams_df$ADJOE)
max_wins  <- max(teams_df$W)
avg_wab   <- mean(teams_df$WAB)

print(paste("Average Adjusted Offensive Efficiency:", avg_adjoe))
print(paste("Maximum Wins:", max_wins))
print(paste("Average WAB:", avg_wab))
print("Nishita Giri S080")
