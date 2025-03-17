
# Combine all data frames of one ab ----
library(dplyr)

# 3 ab to replace 

# cnt_combined ----
# Use a for loop to dynamically bind rows
cnt_combined <- bind_rows(
  lapply(names(gl_AIF.g$l_1B), function(name) {
    if (name != "Normality"){
    gl_AIF.g$l_1B[[name]]}
  }),
  .id = "source"  # Add "source" column to track origin
)

# EXCLUDE THE AREAS
cnt_combined <- cnt_combined[cnt_combined$X != 1 & cnt_combined$X != 2,]

# Calculate Z-scores across combined data

cnt_combined <- cnt_combined %>%
  mutate(
    z_scores = (Mean - mean(Mean, na.rm = TRUE)) / sd(Mean, na.rm = TRUE),
    outlier = abs(z_scores) > 2  # Flag outliers with Z > 3
  )
# Exclude outliers
num_outliers <- sum(cnt_combined$outlier)
cnt_combined <- cnt_combined %>%
  filter(!outlier)
cat(num_outliers, "Outlier rows dropped\n")


# trtA_combined ----
# Use a for loop to dynamically bind rows
trt1_combined <- bind_rows(
  lapply(names(gl_AIF.g$l_7B), function(name) {
    if (name != "Normality"){
    gl_AIF.g$l_7B[[name]]}
  }),
  .id = "source"  # Add "source" column to track origin
)
# EXCLUDE THE AREAS
trt1_combined <- trt1_combined[trt1_combined$X != 1 & trt1_combined$X != 2,]

# Calculate Z-scores across combined data

trt1_combined <- trt1_combined %>%
  mutate(
    z_scores = (Mean - mean(Mean, na.rm = TRUE)) / sd(Mean, na.rm = TRUE),
    outlier = abs(z_scores) > 2  # Flag outliers with Z > 3
  )
# Exclude outliers
num_outliers <- sum(trt1_combined$outlier)
trt1_combined <- trt1_combined %>%
  filter(!outlier)
cat(num_outliers, "Outlier rows dropped\n")





# trtB_combined ----
# Use a for loop to dynamically bind rows
trt2_combined <- bind_rows(
  lapply(names(gl_AIF.g$l_11B), function(name) {
    if (name != "Normality"){
    gl_AIF.g$l_11B[[name]]}
  }),
  .id = "source"  # Add "source" column to track origin
)
# EXCLUDE THE AREAS
trt2_combined <- trt2_combined[trt2_combined$X != 1 & trt2_combined$X != 2,]


# Calculate Z-scores across combined data

trt2_combined <- trt2_combined %>%
  mutate(
    z_scores = (Mean - mean(Mean, na.rm = TRUE)) / sd(Mean, na.rm = TRUE),
    outlier = abs(z_scores) > 2  # Flag outliers with Z > 3
  )
# Exclude outliers
num_outliers <- sum(trt2_combined$outlier)
trt2_combined <- trt2_combined %>%
  filter(!outlier)
cat(num_outliers, "Outlier rows dropped\n")





# Combine ab's to a single data.frame for ANOVA

set_combined <- bind_rows(
  Control = cnt_combined,
  Treated_1 = trt1_combined,
  Treated_2 = trt2_combined,
  .id = "Group"
)

cat("set combined for ANOVA")






# Save the this batch of set_combined (Final save of the data)

saveRDS(set_combined, file = "analysis/raw_rds/AIF_1B_7B_11B.op.g.rds")




