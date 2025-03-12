#IP
options(scipen = 999)

# 1, 7, 11 must be in a single dataframe with their groups tagged
# are called: data_sig OR data_sigx3

group_title <- "1A, 7A, 11A"
alpha <- 0.05

# Anova
anova_result <- aov(Density ~ Group, data = data_sigx3)
summary(anova_result)

summary_table <- summary(anova_result)
p_value <- summary_table[[1]]$`Pr(>F)`[1]


# Tukey's HSD (for pairwise comparisons)

tukey_result <- TukeyHSD(anova_result)
print(tukey_result)




# Sink to the txt file

path <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/analysis/bcl2.ip-p.txt"
sink(path, append = TRUE)

cat("ANOVA", group_title, "\n")
print(summary(anova_result))

if (p_value > alpha){
  cat("ANOVA test shows no significance \n")
} else {
  cat("Tukey's", "\n")
  print(tukey_result)
}

cat("\n ----- \n")

sink()
