
# Outliers: Calculate Z-scores to exclude Outliers ----

library(dplyr)

# Combine all data frames
data_combined <- bind_rows(gl_bax$l_1B$p87, gl_bax$l_1B$p88, .id = "source")  # Add "source" column to track origin

# Calculate Z-scores across combined data
data_combined <- data_combined %>%
  mutate(
    z_scores = (Mean - mean(Mean, na.rm = TRUE)) / sd(Mean, na.rm = TRUE),
    outlier = abs(z_scores) > 1  # Flag outliers with Z > 3
  )

# View results
print(data_combined)

# Separate outliers
outliers <- data_combined %>% filter(outlier)
non_outliers <- data_combined %>% filter(!outlier)

# Optional: Split back into individual datasets
  # result_list <- split(data_combined, data_combined$source)



# Normality Tests ----

# Shapiro ----
shapiro.test(bax_1A$p84$Mean)

# data:  bax_1A$p84$Mean 
# W = 0.95404, p-value = 0.5902

for (i in seq_along(bax_1A)){
  print(names(bax_1A[i]))
  print(shapiro.test(bax_1A[[i]]$Mean))
}

# [1] "p84"
# W = 0.95404, p-value = 0.5902
# [1] "p85"
# W = 0.96543, p-value = 0.837

for (i in seq_along(bax_1B)){
  print(names(bax_1B[i]))
  print(shapiro.test(bax_1B[[i]]$Mean))
}


# Anderson-Darling Test ----
library(nortest)

ad.test(bax_1A$p84$Mean)

# data:  bax_1A$p84$Mean
# A = 0.25737, p-value = 0.6684

for (i in seq_along(bax_1A)){
  print(names(bax_1A[i]))
  print(shapiro.test(bax_1A[[i]]$Mean))
}
# [1] "p84"
# data:  bax_1A[[i]]$Mean
# W = 0.95404, p-value = 0.5902
# 
# [1] "p85"
# W = 0.96543, p-value = 0.837








