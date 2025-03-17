
# Iterate through the sublist and calculate density
threshold <- 90

nm1 <- 88
nm7 <- 43
nm11 <- 46


# ab to replace ?
library(dplyr)

# Sink
path <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/analysis/bax.ip-g.txt"
sink(path, append = TRUE)
cat("1B, 7B, 11B, for the threshold ",threshold, "\n\n")
sink()


# CONTROL ----

# Split the df


l_1B_list <- gl_bax.g$l_1B

areas <- l_1B_list[[1]][1:2, ]
df <- l_1B_list[[1]]

# Split the remaining rows into two groups: first nm.fir and last remaining
group1 <- df[3:(3 + nm1 - 1), ]  # Rows 3 to nm.fir + 2
group2 <- df[(3 + nm1):nrow(df), ]  # Rows nm.fir + 2 to nrow(df)

# Add the area rows to each group
p1 <- rbind(areas[1, ], group1)  # Add the first area to the first group
p2 <- rbind(areas[2, ], group2)  # Add the second area to the second group

l_1B_list <- list(p1 = p1, p2 = p2)




dens_list <- list() 

for (df_name in names(l_1B_list)) {
  if (df_name != "Normality"){
  df <- l_1B_list[[df_name]]

  # Filter rows, ignoring the first
  first_row <- df[1, , drop = FALSE] # Extract the first row
  rest_rows <- df[2:nrow(df), ] # Extract the rest of the rows
  
  filtered_rest <- rest_rows %>% filter(Mean > threshold) # Filter
  cat(df_name, "-> ",nrow(rest_rows) - nrow(filtered_rest), " : Cells dropped (negative) \n")
  
  df <- bind_rows(first_row, filtered_rest) # Combine
  
  area <- df$Area[1]
  values <- df$Area[2:nrow(df)]
  density <- sum(values) / area
  
  dens_list[[df_name]] <- density # Store density with data frame name
  if (is.na(density)){
    dens_list[[df_name]] <- 0
    cat (df_name, " has no positive cells \n")
  }
  
  # Sink to the txt file
  path <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/analysis/bax.ip-g.txt"
  sink(path, append = TRUE)

  cat(df_name, " : ", density, "\n")
  sink()
  
  }
  # Prepare the df for Kruskal test
  cnt_densities <- dens_list
  
}

# Calculate mean and standard error
densities <- unlist(dens_list) # Convert dens_list to a numeric vector

cnt_mean_density <- mean(densities)
sd_density <- sd(densities)
cnt_se_density <- sd_density / sqrt(length(densities)) # Standard error

# Print the results
print(dens_list)
cat("Mean density:", cnt_mean_density, "\n")
cat("Standard error:", cnt_se_density, "\n")



# Treated 1 ----

l_7B_list <- gl_bax.g$l_7B

# Split the df

l_7B_list <- gl_bax.g$l_7B

areas <- l_7B_list[[1]][1:2, ]
df <- l_7B_list[[1]]

# Split the remaining rows into two groups: first nm.fir and last remaining
group1 <- df[3:(3 + nm7 - 1), ]  # Rows 3 to nm.fir + 2
group2 <- df[(3 + nm7):nrow(df), ]  # Rows nm.fir + 2 to nrow(df)

# Add the area rows to each group
p3 <- rbind(areas[1, ], group1)  # Add the first area to the first group
p4 <- rbind(areas[2, ], group2)  # Add the second area to the second group

l_7B_list <- list(p3 = p3, p4 = p4)



dens_list <- list() 

for (df_name in names(l_7B_list)) {
  if (df_name != "Normality"){
  df <- l_7B_list[[df_name]]
  
  # Filter rows, ignoring the first
  first_row <- df[1, , drop = FALSE] # Extract the first row
  rest_rows <- df[2:nrow(df), ] # Extract the rest of the rows
  
  filtered_rest <- rest_rows %>% filter(Mean > threshold) # Filter
  cat(df_name, "-> ",nrow(rest_rows) - nrow(filtered_rest), " : Cells dropped (negative) \n")
  
  df <- bind_rows(first_row, filtered_rest) # Combine
  
  area <- df$Area[1]
  values <- df$Area[2:nrow(df)]
  density <- sum(values) / area
  
  dens_list[[df_name]] <- density # Store density with data frame name
  if (is.na(density)){
    dens_list[[df_name]] <- 0
    cat (df_name, " has no positive cells \n")
    }
    
    # Sink to the txt file
    path <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/analysis/bax.ip-g.txt"
    sink(path, append = TRUE)
    
    cat(df_name, " : ", density, "\n")
    sink()
    
  }
  # Prepare the df for Kruskal test
  trt1_densities <- dens_list
  
}

# Calculate mean and standard error
densities <- unlist(dens_list) # Convert dens_list to a numeric vector

trt1_mean_density <- mean(densities)
sd_density <- sd(densities)
trt1_se_density <- sd_density / sqrt(length(densities)) # Standard error

# Print the results
print(dens_list)
cat("Mean density:", trt1_mean_density, "\n")
cat("Standard error:", trt1_se_density, "\n")




# Treated 2 ----

l_11B_list <- gl_bax.g$l_11B

# Split the df

l_11B_list <- gl_bax.g$l_11B

areas <- l_11B_list[[1]][1:2, ]
df <- l_11B_list[[1]]

# Split the remaining rows into two groups: first nm.fir and last remaining
group1 <- df[3:(3 + nm11 - 1), ]  # Rows 3 to nm.fir + 2
group2 <- df[(3 + nm11):nrow(df), ]  # Rows nm.fir + 2 to nrow(df)

# Add the area rows to each group
p5 <- rbind(areas[1, ], group1)  # Add the first area to the first group
p6 <- rbind(areas[2, ], group2)  # Add the second area to the second group

l_11B_list <- list(p5 = p5, p6 = p6)




dens_list <- list() 

for (df_name in names(l_11B_list)) {
  if (df_name != "Normality"){
  df <- l_11B_list[[df_name]]
  
  # Filter rows, ignoring the first
  first_row <- df[1, , drop = FALSE] # Extract the first row
  rest_rows <- df[2:nrow(df), ] # Extract the rest of the rows
  
  filtered_rest <- rest_rows %>% filter(Mean > threshold) # Filter
  cat(df_name, "-> ",nrow(rest_rows) - nrow(filtered_rest), " : Cells dropped (negative) \n")
  
  df <- bind_rows(first_row, filtered_rest) # Combine
  
  area <- df$Area[1]
  values <- df$Area[2:nrow(df)]
  density <- sum(values) / area
  
  dens_list[[df_name]] <- density # Store density with data frame name
  if (is.na(density)){
    dens_list[[df_name]] <- 0
    cat (df_name, " has no positive cells \n")
  }
    
    # Sink to the txt file
    path <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/analysis/bax.ip-g.txt"
    sink(path, append = TRUE)
    
    cat(df_name, " : ", density, "\n")
    sink()
  
  }
  # Prepare the df for Kruskal test
  trt2_densities <- dens_list
}

# Calculate mean and standard error
densities <- unlist(dens_list) # Convert dens_list to a numeric vector

trt2_mean_density <- mean(densities)
sd_density <- sd(densities)
trt2_se_density <- sd_density / sqrt(length(densities)) # Standard error

# Print the results
print(dens_list)
cat("Mean density:", trt2_mean_density, "\n")
cat("Standard error:", trt2_se_density, "\n")



# Combine ab's to a single data.frame for ANOVA ----

ip_set_combined <- bind_rows(
  Control = c(cnt_mean_density, cnt_se_density),
  Treated_1 = c(trt1_mean_density, trt1_se_density),
  Treated_2 = c(trt2_mean_density, trt2_se_density),
  .id = "Group"
)

cat("set combined for IP Graph")



# Graph of Immunopositivity (Just preparing the data)

# Extract mean and standard error
means <- as.numeric(ip_set_combined[1, ])
se <- as.numeric(ip_set_combined[2, ])
column_names <- names(ip_set_combined)

# Create a data frame for plotting
plot_data <- data.frame(
  Group = column_names,
  Mean = means,
  SE = se
)


# Sink to the txt file

path <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/analysis/bax.ip-g.txt"
sink(path, append = TRUE)

cat("\n Table", "\n")

print(plot_data)

cat("\n ----- \n")

sink()


gl_dens <- list(Control = cnt_densities, Treated_1 = trt1_densities, Treated_2 = trt2_densities)

# Flatten the nested list into a data frame

# data_sig <- bind_rows(
#   lapply(names(gl_dens), function(group) {
#     data.frame(
#       Sample = names(gl_dens[[group]]), # Extract sample names
#       Density = unlist(gl_dens[[group]]), # Extract numeric values
#       Group = group                     # Add group name
#     )
#   })
# )

# Triple the data for ANOVA

library(dplyr)

duplicate_groups <- function(gl_dens) {
  data_sig <- bind_rows(
    lapply(names(gl_dens), function(group) {
      group_data <- data.frame(
        Sample = names(gl_dens[[group]]),
        Density = unlist(gl_dens[[group]]),
        Group = group
      )
      # Duplicate the group data three times
      bind_rows(replicate(4, group_data, simplify = FALSE))
    })
  )
  return(data_sig)
}

data_sigx3 <- duplicate_groups(gl_dens)


print(data_sigx3)

# Save the this batch of plot_data and data_sig

saveRDS(plot_data, file = "analysis/raw_rds/bax_ip_1B_7B_11B_plot_data.g.rds")

saveRDS(data_sigx3, file = "analysis/raw_rds/bax_ip_1B_7B_11B_data_sig.g.rds")



