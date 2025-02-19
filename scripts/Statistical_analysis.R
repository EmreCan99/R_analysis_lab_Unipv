

# Normality Tests ----

# Shapiro ----
shapiro.test(bax_1A$p84$Mean)

# data:  bax_1A$p84$Mean 
# W = 0.95404, p-value = 0.5902

for (i in seq_along(bax_1A)){
  print(names(bax_1A[i]))
  print(shapiro.test(bax_1A[[i]]$Mean))
}

# [1] "p84"
# W = 0.95404, p-value = 0.5902
# [1] "p85"
# W = 0.96543, p-value = 0.837

for (i in seq_along(bax_1B)){
  print(names(bax_1B[i]))
  print(shapiro.test(bax_1B[[i]]$Mean))
}


# Anderson-Darling Test ----
library(nortest)

ad.test(bax_1A$p84$Mean)

# data:  bax_1A$p84$Mean
# A = 0.25737, p-value = 0.6684

for (i in seq_along(bax_1A)){
  print(names(bax_1A[i]))
  print(shapiro.test(bax_1A[[i]]$Mean))
}
# [1] "p84"
# data:  bax_1A[[i]]$Mean
# W = 0.95404, p-value = 0.5902
# 
# [1] "p85"
# W = 0.96543, p-value = 0.837








