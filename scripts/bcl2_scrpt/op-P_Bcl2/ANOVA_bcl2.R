
# 1, 7, 11 must be in a single dataframe with their groups tagged
# are called: set_combined

options(scipen = 999)
alpha <- 0.05

# Anova
anova_result <- aov(Mean ~ Group, data = set_combined)
summary(anova_result)

summary_table <- summary(anova_result)
p_value <- summary_table[[1]]$`Pr(>F)`[1]

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
group_title <- "1B,7B, 11B"
gl_bcl2.p$Tukey[[group_title]] <- tukey_df

# Sink to the txt file

path <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/analysis/bcl2.od-p.txt"
sink(path, append = TRUE)


cat("ANOVA", group_title, "\n")
print(summary(anova_result))

if (p_value > alpha){
  cat("\n ANOVA test shows no significance \n")
}

cat("\n Tukey", group_title, "\n")
print(tukey_result$Group)
cat("\n ----- \n")

sink()


# Save the grand list as R data
saveRDS(gl_bcl2.p, "analysis/gl_bcl2.p.rds")
cat("R data saved")


