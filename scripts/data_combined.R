# Combine all data frames ----

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

cat("Total cells: ", paste(nrow(data_combined)), "\n  ---")
