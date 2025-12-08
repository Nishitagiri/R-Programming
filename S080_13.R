
library(dplyr)

orders_df <- data.frame(
  ORDERNUMBER             = c(10100, 10101, 10101, 10102, 10103, 10100, 10103),
  QUANTITYORDERED         = c(30, 25, 25, 20, 15, 30, 15),
  PRICEEACH               = c(95.7, 88.5, 88.5, 99.0, 120.0, 95.7, 120.0),
  ORDERLINENUMBER         = c(1, 2, 2, 1, 1, 1, 2),
  SALES                   = c(2871, 2212.5, 2212.5, 1980, 1800, 2871, 1800),
  ORDERDATE               = as.Date(c(
    "2003-01-06", "2003-01-09", "2003-01-09",
    "2003-01-10", "2003-01-11", "2003-01-06",
    "2003-01-11")),
  DAYS_SINCE_LASTORDER    = c(0, 3, 3, 1, 2, 0, 2),
  STATUS                  = c("Shipped", "Shipped", "Shipped", 
                              "Resolved", "Cancelled", "Shipped", "Cancelled"),
  PRODUCTLINE             = c("Classic Cars", "Motorcycles", "Motorcycles",
                              "Planes", "Planes", "Classic Cars", "Planes"),
  MSRP                    = c(120, 95, 95, 140, 140, 120, 140),
  PRODUCTCODE             = c("S10_1678", "S10_1949", "S10_1949",
                              "S12_1099", "S12_1099", "S10_1678", "S12_1099"),
  CUSTOMERNAME            = c("Atelier graphique", "Signal Gift Stores",
                              "Signal Gift Stores", "Australian Collectors",
                              "La Rochelle Gifts", "Atelier graphique",
                              "La Rochelle Gifts"),
  PHONE                   = c("40.32.2555", "702-555-1838", "702-555-1838",
                              "03 9520 4555", "40.67.8555", "40.32.2555",
                              "40.67.8555"),
  ADDRESSLINE1            = c("54 rue Royale", "8489 Strong St.",
                              "8489 Strong St.", "636 St Kilda Road",
                              "67, rue des Cinquante Otages", "54 rue Royale",
                              "67, rue des Cinquante Otages"),
  CITY                    = c("Nantes", "Las Vegas", "Las Vegas",
                              "Melbourne", "Nantes", "Nantes", "Nantes"),
  POSTALCODE              = c("44000", "83030", "83030", "3004", "44000",
                              "44000", "44000"),
  COUNTRY                 = c("France", "USA", "USA", "Australia",
                              "France", "France", "France"),
  CONTACTLASTNAME         = c("Schmitt", "King", "King", "Brown",
                              "Labrune", "Schmitt", "Labrune"),
  CONTACTFIRSTNAME        = c("Carine", "Jean", "Jean", "Julie",
                              "Dominique", "Carine", "Dominique"),
  DEALSIZE                = c("Small", "Medium", "Medium", 
                              "Large", "Medium", "Small", "Medium")
)

print("~~ 1) Original Dataset (Note duplicate rows) ~~")
print(orders_df)

duplicates_report <- orders_df %>%
  group_by(
    ORDERNUMBER, QUANTITYORDERED, PRICEEACH, ORDERLINENUMBER,
    SALES, ORDERDATE, DAYS_SINCE_LASTORDER, STATUS,
    PRODUCTLINE, MSRP, PRODUCTCODE, CUSTOMERNAME, PHONE,
    ADDRESSLINE1, CITY, POSTALCODE, COUNTRY,
    CONTACTLASTNAME, CONTACTFIRSTNAME, DEALSIZE
  ) %>%
  count() %>%
  filter(n > 1)

print("~~ 2) Identification Report (Duplicate Rows) ~~")
print(duplicates_report)

clean_exact <- orders_df %>%
  distinct()

print("~~ 3) Dataset After Removing Exact Duplicates ~~")
print(clean_exact)

unique_orders <- orders_df %>%
  distinct(ORDERNUMBER, .keep_all = TRUE)

print("~~ 4) Unique Orders Only (First occurrence kept) ~~")
print(unique_orders)
print("Nishita Giri S080")