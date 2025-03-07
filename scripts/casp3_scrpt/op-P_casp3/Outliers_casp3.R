# Outliers: Calculate Z-scores to exclude Outliers ----
# one for each ab
library(dplyr)

ab <- "l_1A"

# 4 to replace ab

# Combine all data frames ----
# from gpt
bound_names <- c()

# Use a for loop to dynamically bind rows
data_combined <- bind_rows(
  lapply(names(gl_casp3.p[[ab]]), function(name) {
    bound_names <<- c(bound_names, name) 
    # Collect the names of data frames
    gl_casp3.p[[ab]][[name]]
  }),
  .id = "source"  # Add "source" column to track origin
)
# Print the names of the bound data frames
cat("Data frames bound:\n", paste(bound_names, collapse = ", "), "\n")
cat("for ", ab, "\n")
# EXCLUDE THE AREAS
data_combined <- data_combined[data_combined$X != 1,]
cat("Area rows dropped\n")


# Calculate Z-scores across combined data
data_combined <- data_combined %>%
  mutate(
    z_scores = (Mean - mean(Mean, na.rm = TRUE)) / sd(Mean, na.rm = TRUE),
    outlier = abs(z_scores) > 2  # Flag outliers with Z > 3
  )






# ---


# Visialise the outliers in a Boxplot
bar_name <- "casp3_1A"

ggplot(data_combined, aes(x = bar_name, Mean, color = source)) + 
  geom_boxplot(width = 0.3, colour = "grey", fill = "turquoise", alpha = 0.3, outlier.shape = NA) +
  geom_jitter(width = 0.13, size = 3, alpha = 1) +
  labs(color = "# Image") +  # Adds a legend title for the color
  theme(legend.position = "right") +
  theme_bw()  

# View result
print(data_combined)

# Separate outliers
outliers <- data_combined %>% filter(outlier)
non_outliers <- data_combined %>% filter(!outlier)


# Visialise after the filter of outliers in a Boxplot

ggplot(non_outliers, aes(x = bar_name, Mean, color = source)) + 
  geom_boxplot(width = 0.3, colour = "grey", fill = "turquoise", alpha = 0.3, outlier.shape = NA) +
  geom_jitter(width = 0.13, size = 3, alpha = 1) +
  labs(color = "# Image") +  # Adds a legend title for the color
  theme(legend.position = "right") +
  theme_bw()  


# Optional: Split back into individual datasets
# result_list <- split(data_combined, data_combined$source)