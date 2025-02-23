# Normality Tests

# If all three groups have p-values > 0.05, you can proceed with parametric tests.
# If one or more groups have p-values ≤ 0.05, use non-parametric tests.

# ab = gl_bax.p$l_

library(dplyr)
alpha <- 0.05

# Combine all data frames ----
# from gpt
bound_names <- c()

# Use a for loop to dynamically bind rows
data_combined <- bind_rows(
  lapply(names(gl_bax.p$l_1B), function(name) {
    bound_names <<- c(bound_names, name)  # Collect the names of data frames
    gl_bax.p$l_1B[[name]]
  }),
  .id = "source"  # Add "source" column to track origin
)
# Print the names of the bound data frames
cat("Data frames bound:\n", paste(bound_names, collapse = ", "), "\n")

# EXCLUDE THE AREAS
data_combined <- data_combined[data_combined$X != 1,]
cat("Area rows dropped\n")

cat("Total cells: ", paste(nrow(data_combined)), "\n  --- \n")



# Shapiro ----

# Calculate across combined data
result_sh <- shapiro.test(data_combined$Mean)$p.value
print(paste("result_sh: ", result_sh))


if (!"Normality" %in% names(df)) {
  gl_bax.p$l_1B$Normality <- data.frame(Shapiro = NA_character_, stringsAsFactors = FALSE)
}
gl_bax.p$l_1B$Normality$Shapiro <- ifelse(result_sh > alpha, "passed", "NOT passed")



# Anderson-Darling Test ----
library(nortest)

result_ad <- ad.test(data_combined$Mean)$p.value
print(paste("result_ad: ", result_ad))

gl_bax.p$l_1B$Normality <- gl_bax.p$l_1B$Normality %>%
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

result_ag <- agostino.test(data_combined$Mean)
print(paste("result_ag: ", result_ag))

gl_bax.p$l_1B$Normality <- gl_bax.p$l_1B$Normality %>%
  mutate(Agostino = ifelse(result_ag > alpha, "passed", "NOT passed"))



# Kolmogorov-Smirnov Test ----
result_ko <- ks.test(data_combined$Mean, "pnorm", mean = mean(data_combined$Mean), sd = sd(data_combined$Mean))$p.value
print(paste("result_ko: ", result_ko))


gl_bax.p$l_1B$Normality <- gl_bax.p$l_1B$Normality %>%
  mutate(Kolmogorov = ifelse(result_ko > alpha, "passed", "NOT passed"))



# Add all the P Values
tempdf <- data.frame(Shapiro = result_sh, Anderson = result_ad, Agostino = result_ag, Kolmogorov = result_ko)
gl_bax.p$l_1B$Normality <- rbind(gl_bax.p$l_1B$Normality, tempdf)


