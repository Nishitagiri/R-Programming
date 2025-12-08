#Combining datasets vertically (concatenation) using rbind() (R).
#
==============================================================================
  # R Script: Vertical Concatenation using rbind()
  # Datasets: 'iris' (Built-in) and 'flower_dataset.csv' (Custom)
  #
  ==============================================================================
  #
  ==============================================================================
  # 1. SETUP: Create and Import Data
  #
  ==============================================================================
  # 1.1 Load the standard Iris dataset
  data(iris)
# Iris has columns: Sepal.Length, Sepal.Width, Petal.Length, Petal.Width,
Species

flower_df <- read.csv("flower_dataset.csv")
print("--- Data Structure Before Transformation ---")
print(names(iris)) # Sepal.Length, Species, etc.
print(names(flower_df)) # species, height_cm, etc.
#===================================================================
# 2. DATA PREPARATION (Aligning Columns)
#===================================================================
# rbind() will FAIL if column names don't match.
# We must standardize them. Let's create a common structure:
# Common Columns: "Species" and "Height"
# 2.1 Prepare Iris Data
# We will assume 'Sepal.Length' is the 'Height' for this demonstration
iris_clean <- iris[, c("Species", "Sepal.Length")] # Select columns
names(iris_clean) <- c("Species", "Height") # Rename to common standard
# 2.2 Prepare Flower Data
flower_clean <- flower_df[, c("species", "height_cm")] # Select columns
names(flower_clean) <- c("Species", "Height") # Rename to common
standard
# Ensure both are numeric (Good practice)
iris_clean$Height <- as.numeric(iris_clean$Height)
flower_clean$Height <- as.numeric(flower_clean$Height)
#==================================================================
# 3. VERTICAL COMBINATION (rbind)
#==================================================================

Dr. Mahendra K.

3

# Now that columns match (Species, Height), we can stack them.
combined_data <- rbind(iris_clean, flower_clean)
print("--- Combined Data Summary ---")
print(paste("Iris rows:", nrow(iris_clean)))
print(paste("Flower rows:", nrow(flower_clean)))
print(paste("Total rows (Expected):", nrow(iris_clean) + nrow(flower_clean)))
print(paste("Total rows (Actual):", nrow(combined_data)))
print("--- Preview of Combined Data (Top and Bottom) ---")
print(head(combined_data)) # Shows Iris data (Setosa...)
print(tail(combined_data)) # Shows Flower data (Rose...)