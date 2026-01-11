library(ggplot2)

# 1. Load the data
df <- read.csv("~/Nishita/survey lung cancer.csv")
df <- na.omit(df)

# 2. Selecting and Renaming columns to mirror your structure
# We pick Age (col 2), Smoking (col 3), and Alcohol Consuming (col 11)
colnames(df)[2] <- "Age"
colnames(df)[3] <- "Smoking_Rate"
colnames(df)[11] <- "Alcohol_Rate"

# 3. Calculate Correlation Matrix
# We use only the renamed columns for the matrix
cor_matrix <- cor(df[, c("Age", "Smoking_Rate", "Alcohol_Rate")])
print(cor_matrix)

# 4. Correlation Test between Age and Smoking
test_results <- cor.test(df$Age, df$Smoking_Rate)
print(test_results)

# 5. Prepare data for heatmap
melted_cor <- as.data.frame.table(cor_matrix)
colnames(melted_cor) <- c("Var1", "Var2", "value")

# 6. Visualization: Correlation Heatmap
ggplot(data = melted_cor, aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Correlation") +
  theme_minimal() +
  labs(title = "Correlation Matrix of Lung Cancer Factors-Nishita Giri S080",
       subtitle = paste("Correlation (Age vs Smoking):", round(test_results$estimate, 2), 
                        " | P-value:", format.pval(test_results$p.value)),
       x = "", y = "") +
  geom_text(aes(Var2, Var1, label = round(value, 2)), color = "black", size = 4)