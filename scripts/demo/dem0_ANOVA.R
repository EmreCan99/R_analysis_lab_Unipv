

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

# Add Pair-wise comparison to the grand list

tukey_df <- data.frame(
  Groups = rownames(tukey_result$Group),
  p.value = tukey_result$Group[, 4]
)

# ! Change the list Title
gl_bax.p$Tukey$`1A,7A,11A` <- tukey_df









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
  # geom_jitter(width = 0.2, alpha = 0.5) +
  theme_minimal() +
  # ! Change the title
  labs(title = "One-Way ANOVA Results - Bax 1A, 7A, 11A", y = "op-Mean", x = "Condition") +
  theme(
    text = element_text(size = 14),
    axis.title = element_text(size = 16),
    axis.text = element_text(size = 12))

plt

hgt <- 120 #Height
hgt2 <- 140

plt + 
  geom_line(data = data.frame(x=c(2,3), y=c(hgt,hgt)), size = 1, 
                aes(x=x, y=y), inherit.aes = FALSE) +
  geom_line(data = data.frame(x=c(3,3), y=c(hgt,115)), size = 1, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_text(data = data.frame(x=c(2.5), y=c(122)), label = "*", size = 12, 
                aes(x=x, y=y), inherit.aes = FALSE) +

  
  geom_line(data = data.frame(x=c(1,3), y=c(hgt2,hgt2)), size = 1, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_line(data = data.frame(x=c(3,3), y=c(hgt2,135)), size = 1, 
            aes(x=x, y=y), inherit.aes = FALSE) +
  geom_text(data = data.frame(x=c(2), y=c(142)), label = "**", size = 12, 
            aes(x=x, y=y), inherit.aes = FALSE) 



 