
# Combine all data frames of one ab ----


# cnt_combined
# Use a for loop to dynamically bind rows
cnt_combined <- bind_rows(
  lapply(names(gl_bax.p$l_1A), function(name) {
    gl_bax.p$l_1A[[name]]
  }),
  .id = "source"  # Add "source" column to track origin
)
# EXCLUDE THE AREAS
cnt_combined <- cnt_combined[cnt_combined$X != 1,]


# trtA_combined
# Use a for loop to dynamically bind rows
trtA_combined <- bind_rows(
  lapply(names(gl_bax.p$l_7A), function(name) {
    gl_bax.p$l_7A[[name]]
  }),
  .id = "source"  # Add "source" column to track origin
)
# EXCLUDE THE AREAS
trtA_combined <- trtA_combined[trtA_combined$X != 1,]


# trtB_combined
# Use a for loop to dynamically bind rows
trtB_combined <- bind_rows(
  lapply(names(gl_bax.p$l_7B), function(name) {
    gl_bax.p$l_7B[[name]]
  }),
  .id = "source"  # Add "source" column to track origin
)
# EXCLUDE THE AREAS
trtB_combined <- trtB_combined[trtB_combined$X != 1,]


# Combine ab's to a single data.frame for ANOVA

set_combined <- bind_rows(
  Control = cnt_combined,
  Treated_A = trtA_combined,
  Treated_B = trtB_combined,
  .id = "Group"
)

cat("set combined for ANOVA")
