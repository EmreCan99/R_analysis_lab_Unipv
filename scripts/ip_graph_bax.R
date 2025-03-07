

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

# Create the bar chart with error bars
ip_plt <- ggplot(plot_data, aes(x = Group, y = Mean, fill = Group)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = Mean - SE, ymax = Mean + SE), width = 0.2) +
  labs(title = "Immunopositive Cell Densitiy 1B, 7B, 11B", y = "Mean Cell Density (cutoff 96)") +
  theme(
    legend.position = "none",
    text = element_text(size = 14),
    plot.title = element_text(size = 12),
    axis.title = element_text(size = 10),
    axis.text = element_text(size = 9),
    axis.title.x = element_blank()) 
    # scale_y_continuous(labels = function(x) ifelse(x < 0.01 & x > 0, scientific(x), number_format(accuracy = 0.01)(x)))

ip_plt


# Save

ggsave(filename = "analysis/bax_ip_1B_7B_11B.png", plot = ip_plt, 
       width = 12, height = 10, dpi = 300, units = "cm")

saveRDS(plt.sig, file = "analysis/bax_ip_1B_7B_11B.rds")


