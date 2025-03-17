
# Visualition

library(ggplot2)
library(ggpubr)

# Box plot and Jitter
ggplot(set_combined, aes(x = Group, y = Mean, fill = Group)) +
  geom_boxplot() +
  geom_jitter(width = 0.2, alpha = 0.3) +
  theme_minimal() +
  labs(title = "One-Way ANOVA Results - bcl2 1B, 7B, 11B", y = "op-Mean", x = "Condition")



# Bar Chart for significancy ----

max_value <- max(set_combined$Mean) # Calculate the maximum value of your data
padding <- 34 # Add some padding above the maximum value STANDART 22

plt <- ggplot(set_combined, aes(x = Group, y = Mean, fill = Group)) +
  stat_summary(fun = mean, geom = "bar", color = "black", alpha = 1, width = 0.6) + # width 0.6
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) +
  # geom_jitter(width = 0.2, alpha = 0.5, size = 0.5) +
  # ! Change the title
  scale_y_continuous(expand = c(0, 0), limits = c(0, max_value + padding)) +
  labs(title = "bcl2 1B, 7B, 11B", y = "Gralunular Cells (OD)", x = "Condition") +
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

hgt <- 140 #Height
hgt2 <- 135
size <- 0.4

plt.sig <- plt + 
  geom_line(data = data.frame(x=c(2.05,3), y=c(hgt,hgt)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_line(data = data.frame(x=c(3,3), y=c(hgt,hgt-5)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_line(data = data.frame(x=c(2.05,2.05), y=c(hgt,hgt-5)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_text(data = data.frame(x=c(1.5), y=c(hgt+2)), label = "***", size = 7, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  
  
  geom_line(data = data.frame(x=c(1,1.95), y=c(hgt,hgt)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_line(data = data.frame(x=c(1.95,1.95), y=c(hgt,hgt-5)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_line(data = data.frame(x=c(1,1), y=c(hgt,hgt-5)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_text(data = data.frame(x=c(2.5), y=c(hgt+2)), label = "***", size = 7, 
            aes(x=x, y=y), inherit.aes = FALSE) 
  
  # geom_line(data = data.frame(x=c(1,3), y=c(hgt2,hgt2)), size = size,
  #           aes(x=x, y=y), inherit.aes = FALSE) +
  # geom_line(data = data.frame(x=c(1,1), y=c(hgt2,hgt2-5)), size = size,
  #           aes(x=x, y=y), inherit.aes = FALSE) +
  # geom_line(data = data.frame(x=c(3,3), y=c(hgt2,hgt2-5)), size = size,
  #           aes(x=x, y=y), inherit.aes = FALSE) +
  # geom_text(data = data.frame(x=c(2), y=c(hgt2 + 2)), label = "***", size = 7,
  #           aes(x=x, y=y), inherit.aes = FALSE)

plt.sig



#Save the plot


ggsave(filename = "analysis/g_op_plt/g_bcl2_1B_7B_11B.png", plot = plt, 
       width = 12, height = 8, dpi = 300, units = "cm")

saveRDS(plt, file = "analysis/g_bcl2_1B_7B_11B.rds")


ggsave(filename = "analysis/g_op_plt/g_bcl2_1B_7B_11B.sig.png", plot = plt.sig, 
       width = 12, height = 8, dpi = 300, units = "cm")

saveRDS(plt.sig, file = "analysis/g_bcl2_1A_7A_11A.sig.rds")
