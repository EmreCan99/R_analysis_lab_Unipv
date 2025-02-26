

# 1, 7, 11 must be in a single dataframe with their groups tagged
# are called: set_combined

# Anova
anova_result <- aov(Mean ~ Group, data = set_combined)
summary(anova_result)


# Verify the assumptions on homogenity
# library(car)
# 
# leveneTest(Mean ~ Group, data = set_combined)  # Levene's Test


# Tukey's HSD (for pairwise comparisons)

tukey_result <- TukeyHSD(anova_result)
print(tukey_result)

# Add Pair-wise comparison to the grand listü

tukey_df <- data.frame(
  Groups = rownames(tukey_result$Group),
  p.value = tukey_result$Group[, 4]
)

# ! Change the list Title
group_title <- "1A,7A,11A"
gl_bax.p$Tukey[[group_title]] <- tukey_df

# Sink to the txt file

path <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/analysis/bax.p.txt"
sink(path, append = TRUE)

cat("Tukey", group_title, "\n")
tukey_result$Group
cat("\n ----- \n")

sink()


# Save the grand list as R data
saveRDS(gl_bax.p, "analysis/gl_bax.p.rds")
cat("R data saved")





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
  stat_summary(fun = mean, geom = "bar", color = "black", alpha = 0.7, width = 0.6) +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) +
  # geom_jitter(width = 0.2, alpha = 0.5, size = 0.5) +
  # ! Change the title
  labs(title = "Bax 1B, 7B, 11B", y = "op-Mean", x = "Condition") +
  theme(
    legend.position = "none",
    text = element_text(size = 14),
    plot.title = element_text(size = 12),
    axis.title = element_text(size = 10),
    axis.text = element_text(size = 9))

plt

hgt <- 120 #Height
hgt2 <- 120
size <- 0.4

plt.sig <- plt + 
  geom_line(data = data.frame(x=c(2.05,3), y=c(hgt,hgt)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_line(data = data.frame(x=c(3,3), y=c(hgt,hgt-5)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_line(data = data.frame(x=c(2.05,2.05), y=c(hgt2,hgt2-5)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_text(data = data.frame(x=c(1.5), y=c(122)), label = "***", size = 7, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  
  
  geom_line(data = data.frame(x=c(1,1.95), y=c(hgt2,hgt2)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_line(data = data.frame(x=c(1.95,1.95), y=c(hgt2,hgt2-5)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_line(data = data.frame(x=c(1,1), y=c(hgt2,hgt2-5)), size = size, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_text(data = data.frame(x=c(2.5), y=c(122)), label = "***", size = 7, 
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


ggsave(filename = "analysis/bax_1A_7A-11A.sig.png", plot = plt.sig, 
       width = 12, height = 10, dpi = 300, units = "cm")

saveRDS(plt.sig, file = "analysis/bax_1A_7A-11A.sig.rds")
