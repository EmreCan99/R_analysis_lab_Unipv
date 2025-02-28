#IP

# 1, 7, 11 must be in a single dataframe with their groups tagged
# are called: data_sig

group_title <- "1B, 7B, 11B"
alpha <- 0.05

# Anova
kruskal_result <- kruskal.test(Density ~ Group, data = data_sig)
print(kruskal_result)



# Dunn's Post-hoc Test (for pairwise comparisons)
library(FSA)
data_sig$Group <- as.factor(data_sig$Group) # Coerce the Group to factor

dunn_result <- dunnTest(Density ~ Group, data = data_sig, method = "bonferroni")
print(dunn_result)



# Sink to the txt file

path <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/analysis/bax.ip-p.txt"
sink(path, append = TRUE)

cat("Kruskal-Wallis", group_title, "\n")
print(kruskal_result)

if (kruskal_result$p.value > alpha){
  cat("Kruskal-Wallis test shows no significance \n")
} else {
  cat("Dunn's Post-hoc", "\n")
  print(dunn_result)
}

cat("\n ----- \n")

sink()
