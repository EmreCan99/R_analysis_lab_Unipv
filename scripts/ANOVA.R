

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
