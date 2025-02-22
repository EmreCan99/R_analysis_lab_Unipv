if(!require(ggpubr)){install.packages("ggpubr")}
library(ggpubr)
library(ggplot2)

# Combine Boxplot and Jitterplot ----

# Sample data (replace with your data)
data <- data.frame(Value = rnorm(100, 0, 1), Group = sample(c("A", "B", "C"), 100, replace = TRUE))

# Combined boxplot and jitter plot
ggplot(data, aes(x = Group, y = Value)) +
  geom_boxplot(width = 0.5, outlier.shape = NA, fill = "turquoise", alpha = 0.2) +  # Boxplot, suppress outliers
  geom_jitter(width = 0.2, alpha = 0.6) +   # Jittered points
  labs(title = "Boxplot with Data Points", x = "Group", y = "Value") +
  theme_bw() # Optional: Use a black and white theme







# Before and After outliers Boxplot ----
# Sample data (replace with your data)
control_data <- rnorm(100, 0, 1)  # Simulated control data
treated1_data <- rnorm(100, 0.5, 1.5) # Simulated treated data with more variation
treated2_data <- rnorm(100, 1, 1)

# Boxplot method for outlier removal - IQR
remove_outliers <- function(data) {
  Q1 <- quantile(data, 0.25)
  Q3 <- quantile(data, 0.75)
  IQR <- Q3 - Q1
  lower_bound <- Q1 - 1.5 * IQR
  upper_bound <- Q3 + 1.5 * IQR
  data[data >= lower_bound & data <= upper_bound]
}

control_cleaned <- remove_outliers(control_data)
treated1_cleaned <- remove_outliers(treated1_data)
treated2_cleaned <- remove_outliers(treated2_data)



# ... (your outlier removal code as before) ...

# Create data frames for plotting (all in one data frame)
plot_data <- rbind(
  data.frame(Value = control_data, Group = "Control", State = "Before"),
  data.frame(Value = control_cleaned, Group = "Control", State = "After"),
  data.frame(Value = treated1_data, Group = "Treated 1", State = "Before"),
  data.frame(Value = treated1_cleaned, Group = "Treated 1", State = "After"),
  data.frame(Value = treated2_data, Group = "Treated 2", State = "Before"),
  data.frame(Value = treated2_cleaned, Group = "Treated 2", State = "After")
)

# Create the boxplot with facets
ggplot(plot_data, aes(x = State, y = Value, fill = State)) +  # Fill by state
  geom_boxplot() +
  facet_wrap(~ Group, scales = "free_y") +  # Facet by group, free y-axis scales (remove if you want the same scale)
  labs(title = "Outlier Removal Effect", x = "", y = "Value") +
  theme(legend.position = "none")  # Remove legend if desired







