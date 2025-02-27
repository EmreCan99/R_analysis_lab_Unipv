
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

path <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/analysis/bax.od-p.txt"
sink(path, append = TRUE)

cat("Tukey", group_title, "\n")
tukey_result$Group
cat("\n ----- \n")

sink()


# Save the grand list as R data
saveRDS(gl_bax.p, "analysis/gl_bax.p.rds")
cat("R data saved")


