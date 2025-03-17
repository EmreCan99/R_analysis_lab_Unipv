group_name <- "1A, 7A, 11A"

# Calculate means and standard deviations for each group
group_summary <- aggregate(Mean ~ Group, data = set_combined, FUN = function(x) c(mean = mean(x), sd = sd(x), n = length(x)))

# Extract means, standard deviations, and group names
means <- group_summary$Mean[, "mean"]
sds <- group_summary$Mean[, "sd"]
ns <- group_summary$Mean[, "n"]
groups <- group_summary$Group

# Calculate standard error of the mean (SEM)
sems <- sds / sqrt(ns)

# Create a data frame for easy output
result_df <- data.frame(Group = groups, Mean = means, sem = sems)



# Print the result to the console (optional)
print(result_df)



# Sink to the txt file

path <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/analysis/casp9.od-g.txt"
sink(path, append = TRUE)

cat("\n", group_name, "Means ± SEM \n")

print(result_df)

cat("\n ----- \n")

sink()


#To retrieve

saved.g.A <- readRDS("analysis/raw_rds/AIF_1A_7A_11A.op.g.rds")
saved.p.A <- readRDS("analysis/raw_rds/casp9_1A_7A_11A.op.p.rds")
saved.p.B <- readRDS("analysis/raw_rds/casp9_1B_7B_11B.op.p.rds")
saved.g.B <- readRDS("analysis/raw_rds/AIF_1B_7B_11B.op.g.rds")


set_combined <- saved.g.A
set_combined <- saved.p.A 
set_combined <- saved.p.B
set_combined <- saved.g.B


