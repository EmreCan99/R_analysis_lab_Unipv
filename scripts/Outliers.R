# Outliers: Calculate Z-scores to exclude Outliers ----

library(dplyr)

# Combine all data frames
data_combined <- bind_rows(gl_bax.p$l_1B$p87, 
                           gl_bax.p$l_1B$p88, 
                           gl_bax.p$l_1B$p89, 
                           gl_bax.p$l_1B$p90, .id = "source")  # Add "source" column to track origin

# Calculate Z-scores across combined data
data_combined <- data_combined %>%
  mutate(
    z_scores = (Mean - mean(Mean, na.rm = TRUE)) / sd(Mean, na.rm = TRUE),
    outlier = abs(z_scores) > 2  # Flag outliers with Z > 3
  )

# Visialise the outliers in a Boxplot

ggplot(data_combined, aes(x = "Bax_1B", Mean, color = source)) + 
  geom_boxplot(width = 0.3, colour = "grey", fill = "turquoise", alpha = 0.3, outlier.shape = NA) +
  geom_jitter(width = 0.13, size = 3, alpha = 1) +
  labs(color = "# Image") +  # Adds a legend title for the color
  theme(legend.position = "right") +
  theme_bw()  

# View results# View resultssource()
print(data_combined)

# Separate outliers
outliers <- data_combined %>% filter(outlier)
non_outliers <- data_combined %>% filter(!outlier)

# Optional: Split back into individual datasets
# result_list <- split(data_combined, data_combined$source)