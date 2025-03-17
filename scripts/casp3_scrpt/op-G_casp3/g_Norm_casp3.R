# Normality Tests

# to use after outliers

# If all three groups have p-values > 0.05, you can proceed with parametric tests.
# If one or more groups have p-values ≤ 0.05, use non-parametric tests.
# 29 to replace ab


library(dplyr)
alpha <- 0.05

# Combine all data frames ----
# from gpt
bound_names <- c()

# Use a for loop to dynamically bind rows
data_combined_1A <- bind_rows(
  lapply(names(gl_casp3.g$l_1A), function(name) {
    if (name != "Normality"){
    bound_names <<- c(bound_names, name)  # Collect the names of data frames
    gl_casp3.g$l_1A[[name]]}
  }),
  .id = "source"  # Add "source" column to track origin
)
# Print the names of the bound data frames
cat("Data frames bound:\n", paste(bound_names, collapse = ", "), "\n")

# EXCLUDE THE AREAS
data_combined_1A <- data_combined_1A[data_combined_1A$X != 1 & data_combined_1A$X != 2, ]
cat("Area rows dropped\n")

cat("Total cells: ", paste(nrow(data_combined_1A)), "\n  --- \n")


# Calculate Z-scores across combined data

data_combined_1A <- data_combined_1A %>%
  mutate(
    z_scores = (Mean - mean(Mean, na.rm = TRUE)) / sd(Mean, na.rm = TRUE),
    outlier = abs(z_scores) > 2  # Flag outliers with Z > 3
  )


# Exclude outliers
num_outliers <- sum(data_combined_1A$outlier)
data_combined_1A <- data_combined_1A %>%
  filter(!outlier)
cat(num_outliers, "Outlier rows dropped\n")



# Shapiro ----

# Calculate across combined data
result_sh <- shapiro.test(data_combined_1A$Mean)$p.value
print(paste("result_sh: ", result_sh))


if (!"Normality" %in% names(df)) {
  gl_casp3.g$l_1A$Normality <- data.frame(Shapiro = NA_character_, stringsAsFactors = FALSE)
}
gl_casp3.g$l_1A$Normality$Shapiro <- ifelse(result_sh > alpha, "passed", "NOT passed")



# Anderson-Darling Test ----
library(nortest)

result_ad <- ad.test(data_combined_1A$Mean)$p.value
print(paste("result_ad: ", result_ad))

gl_casp3.g$l_1A$Normality <- gl_casp3.g$l_1A$Normality %>%
  mutate(Anderson = ifelse(result_ad > alpha, "passed", "NOT passed"))




# D'Agostino-Pearson Test ----
library(moments)

agostino.test <- function(x) {
  skew <- skewness(x)
  kurt <- kurtosis(x)
  n <- length(x)
  z_skew <- sqrt(6 * n * (n - 1) / ((n - 2) * (n + 1) * (n + 3))) * skew
  z_kurt <- sqrt(24 * n * (n - 1)^2 / ((n - 3) * (n + 5) * (n + 1) * (n + 3))) * (kurt - 3)
  p_value <- 1 - pchisq(z_skew^2 + z_kurt^2, df = 2)
  return(p_value)
}

result_ag <- agostino.test(data_combined_1A$Mean)
print(paste("result_ag: ", result_ag))

gl_casp3.g$l_1A$Normality <- gl_casp3.g$l_1A$Normality %>%
  mutate(Agostino = ifelse(result_ag > alpha, "passed", "NOT passed"))



# Kolmogorov-Smirnov Test ----
result_ko <- ks.test(data_combined_1A$Mean, "pnorm", mean = mean(data_combined_1A$Mean), sd = sd(data_combined_1A$Mean))$p.value
print(paste("result_ko: ", result_ko))


gl_casp3.g$l_1A$Normality <- gl_casp3.g$l_1A$Normality %>%
  mutate(Kolmogorov = ifelse(result_ko > alpha, "passed", "NOT passed"))



# Add all the P Values
tempdf <- data.frame(Shapiro = result_sh, Anderson = result_ad, Agostino = result_ag, Kolmogorov = result_ko)
gl_casp3.g$l_1A$Normality <- rbind(gl_casp3.g$l_1A$Normality, tempdf)


