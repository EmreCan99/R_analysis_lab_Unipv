

# Graph of Immunopositivity

# takes data as : plot_data

# Extract mean and standard error
means <- as.numeric(ip_set_combined[1, ])
se <- as.numeric(ip_set_combined[2, ])
column_names <- names(ip_set_combined)

# Create a data frame for plotting (again)
library(scales)

plot_data <- data.frame(
  Group = column_names,
  Mean = means,
  SE = se
)

# Bar Chart for significancy ----

max_value <- max(plot_data$Mean) # Calculate the maximum value of your data
padding <- 0.005 # Add some padding above the maximum value STANDART 0

plt <- ggplot(plot_data, aes(x = Group, y = Mean, fill = Group)) +
  stat_summary(fun = mean, geom = "bar", color = "black", alpha = 1, width = 0.6) + # width 0.6
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) +
  # geom_jitter(width = 0.2, alpha = 0.5, size = 0.5) +

  scale_y_continuous(expand = c(0, 0), limits = c(0, max_value + padding)) +
  labs(title = "casp8 1B, 7B, 11B", y = "Purkinje Cell Density", x = "Condition") +
  theme_classic() +
  scale_x_discrete(labels = c("CTR", "VP", "VP-Waste")) +
  scale_fill_manual(values = c("#222222", "#BBBBBB", "#666666")) + # Custom gray shades
  theme(
    legend.position = "none",
    text = element_text(size = 14),
    plot.title = element_text(size = 12),
    axis.title = element_text(size = 16), # Y label
    axis.text = element_text(size = 14),
    axis.title.x = element_blank()) # Bar labels


plt



# Save

ggsave(filename = "analysis/casp8_ip_1B_7B_11B.png", plot = plt, 
       width = 12, height = 8, dpi = 300, units = "cm")

saveRDS(plt, file = "analysis/casp8_ip_1B_7B_11B.rds")


