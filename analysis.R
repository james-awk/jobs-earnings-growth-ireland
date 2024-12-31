library(tidyverse)
library(scales)

# Read the datasets
ehq_data <- read.csv("EHQ03_cleaned.csv")
cpi_data <- read.csv("CPI_Quarterly_cleaned.csv")

# Convert Quarter to Date format
ehq_data$Quarter <- as.Date(ehq_data$Quarter)
cpi_data$Quarter <- as.Date(cpi_data$Quarter)

# Calculate real wages
ehq_data <- ehq_data %>%
  left_join(cpi_data, by = "Quarter") %>%
  mutate(Real_Wage = Average_Weekly_Earnings_Seasonally_Adjusted / CPI * 100)

# Calculate growth rates by sector
growth_data <- ehq_data %>%
  group_by(Economic_Sector) %>%
  arrange(Quarter) %>%
  mutate(
    # Calculate employment growth
    Employment_Growth = (as.numeric(Employment) / first(as.numeric(Employment)) - 1) * 100,
    # Calculate real wage growth
    Wage_Growth = (Real_Wage / first(Real_Wage) - 1) * 100
  ) %>%
  pivot_longer(
    cols = c(Employment_Growth, Wage_Growth),
    names_to = "Metric",
    values_to = "Growth"
  )
