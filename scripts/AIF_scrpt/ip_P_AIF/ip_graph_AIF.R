

# Graph of Immunopositivity
library(ggplot2)
library(ggpubr)

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
padding <- 0.0130 # Add some padding above the maximum value STANDART 0
pmin <- 5.5

plt <- ggplot(plot_data, aes(x = Group, y = Mean, fill = Group)) +
  # stat_summary(fun = mean, geom = "bar", color = "black", alpha = 1, width = 0.6) + # width 0.6
  # stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) +
  # geom_jitter(width = 0.2, alpha = 0.5, size = 0.5) +
  geom_bar(stat = "identity", color = "black", alpha = 1, width = 0.6) + # Bar plot using Mean
  geom_errorbar(aes(ymin = Mean , ymax = Mean + SE), width = 0.2) + # Error bars
  
  scale_y_continuous(expand = c(0, 0), limits = c(0, max_value + padding)) +
  labs(title = "AIF 1B, 7B, 11B", y = "Purkinje Cell Density", x = "Condition") +
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

hgt <- max_value + padding - (padding/pmin) #Height
hgt2 <- hgt - hgt/7 # to add all make it 7 and for two make 22
dht <- hgt/25
size <- 0.5

plt.sig <- plt + 
  geom_line(data = data.frame(x=c(2.05,3), y=c(hgt2,hgt2)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_line(data = data.frame(x=c(3,3), y=c(hgt2,hgt2-dht)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_line(data = data.frame(x=c(2.05,2.05), y=c(hgt2,hgt2-dht)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_text(data = data.frame(x=c(1.5), y=c(hgt2+dht)), label = "***", size = 8, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  
  
  geom_line(data = data.frame(x=c(1,1.95), y=c(hgt2,hgt2)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_line(data = data.frame(x=c(1.95,1.95), y=c(hgt2,hgt2-dht)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_line(data = data.frame(x=c(1,1), y=c(hgt2,hgt2-dht)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_text(data = data.frame(x=c(2.5), y=c(hgt2+dht)), label = "***", size = 8, 
            aes(x=x, y=y), inherit.aes = FALSE) +

  geom_line(data = data.frame(x=c(1,3), y=c(hgt,hgt)), size = size,
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_line(data = data.frame(x=c(1,1), y=c(hgt,hgt-dht)), size = size,
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_line(data = data.frame(x=c(3,3), y=c(hgt,hgt-dht)), size = size,
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_text(data = data.frame(x=c(2), y=c(hgt + dht)), label = "**", size = 8,
            aes(x=x, y=y), inherit.aes = FALSE)

plt.sig



# Save

ggsave(filename = "analysis/ip_plt/AIF_ip_1B_7B_11B.png", plot = plt.sig, 
       width = 12, height = 8, dpi = 300, units = "cm")

saveRDS(plt.sig, file = "analysis/AIF_ip_1B_7B_11B.rds")


