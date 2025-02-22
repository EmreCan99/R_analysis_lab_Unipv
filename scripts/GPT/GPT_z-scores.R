# Example data frames
library(dplyr)

df1 <- data.frame(id = 1:5, value = c(1, 3, 5, 100, 6))
df2 <- data.frame(id = 6:10, value = c(10, 12, 14, 150, 16))

# Combine all data frames
data_combined <- bind_rows(df1, df2, .id = "source")  # Add "source" column to track origin

# Calculate Z-scores across combined data
data_combined <- data_combined %>%
  mutate(
    z_scores = (value - mean(value, na.rm = TRUE)) / sd(value, na.rm = TRUE),
    outlier = abs(z_scores) > 2  # Flag outliers with Z > 3
  )

# View results
print(data_combined)

# Separate outliers
outliers <- data_combined %>% filter(outlier)
non_outliers <- data_combined %>% filter(!outlier)

# Optional: Split back into individual datasets
result_list <- split(data_combined, data_combined$source)

