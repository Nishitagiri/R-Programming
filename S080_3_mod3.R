data3 <- read.csv(
  "C:/Users/info/Downloads/Iris - Iris.csv",
  stringsAsFactors = FALSE
)

head(data3)

table(data3$Species)

table(data3$Species, data3$SepalLengthCm)

table(data3$Species, data3$SepalWidthCm)

table(data3$Species, data3$PetalLengthCm)

table(data3$Species, data3$PetalWidthCm)

addmargins(table(data3$Species, data3$PetalLengthCm))
print("Nishita giri S080")