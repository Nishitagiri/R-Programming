# 1. Load Libraries
library(stats)

# 2. Read CSV
tb_data <- read.csv("~/Nishita/incidenceoftuberculosis new.csv", 
                    stringsAsFactors = FALSE)

# 3. Clean Data
tb_data$Estimated.incidence.of.all.forms.of.tuberculosis <- as.numeric(tb_data$Estimated.incidence.of.all.forms.of.tuberculosis)
tb_data <- na.omit(tb_data) 

# 4. Convert Factors
tb_data$Entity <- as.factor(tb_data$Entity)

tb_data$Year <- as.factor(tb_data$Year)


anova_model <- aov(
  Estimated.incidence.of.all.forms.of.tuberculosis ~ Entity + Year, 
  data = tb_data
)

# 6. Output
summary(anova_model)
print("Nishita Giri S080")