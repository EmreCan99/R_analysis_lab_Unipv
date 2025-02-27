
# Visualition

library(ggplot2)
library(ggpubr)

# Box plot and Jitter
ggplot(set_combined, aes(x = Group, y = Mean, fill = Group)) +
  geom_boxplot() +
  geom_jitter(width = 0.2, alpha = 0.3) +
  theme_minimal() +
  labs(title = "One-Way ANOVA Results - Bax 1A, 7A, 11A", y = "op-Mean", x = "Condition")



# Bar Chart for significancy ----

plt <- ggplot(set_combined, aes(x = Group, y = Mean, fill = Group)) +
  stat_summary(fun = mean, geom = "bar", color = "black", alpha = 0.8, width = 0.6) +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) +
  # geom_jitter(width = 0.2, alpha = 0.5, size = 0.5) +
  # ! Change the title
  labs(title = "Bax 1B, 7B, 11B", y = "Mean Gray-Value", x = "Condition") +
  theme(
    legend.position = "none",
    text = element_text(size = 14),
    plot.title = element_text(size = 12),
    axis.title = element_text(size = 10),
    axis.text = element_text(size = 9),
    axis.title.x = element_blank())


plt

hgt <- 140 #Height
hgt2 <- 150
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
            aes(x=x, y=y), inherit.aes = FALSE) +
  
  geom_line(data = data.frame(x=c(1,3), y=c(hgt2,hgt2)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_line(data = data.frame(x=c(1,1), y=c(hgt2,hgt2-5)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_line(data = data.frame(x=c(3,3), y=c(hgt2,hgt2-5)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_text(data = data.frame(x=c(2), y=c(hgt2 + 2)), label = "*", size = 7, 
            aes(x=x, y=y), inherit.aes = FALSE)

plt.sig

# # For only star wiev
# plt.sig <- plt + 
#   geom_text(data = data.frame(x=c(2), y=c(122)), label = "***", size = 8, 
#             aes(x=x, y=y), inherit.aes = FALSE) +
#   geom_text(data = data.frame(x=c(3), y=c(142)), label = "***", size = 8, 
#             aes(x=x, y=y), inherit.aes = FALSE) 
# 
# plt.sig

#Save the plot


ggsave(filename = "analysis/bax_1A_7A-11A.png", plot = plt, 
       width = 12, height = 10, dpi = 300, units = "cm")

saveRDS(plt, file = "analysis/bax_1A_7A-11A.rds")


ggsave(filename = "analysis/bax_1B_7B-11B.sig.png", plot = plt.sig, 
       width = 12, height = 10, dpi = 300, units = "cm")

saveRDS(plt.sig, file = "analysis/bax_1B_7B-11B.sig.rds")
