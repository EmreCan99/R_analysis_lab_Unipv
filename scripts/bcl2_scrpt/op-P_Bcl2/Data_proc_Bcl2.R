
# Import the entire folder .csv ----

# Set the directory containing the files
directory <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/data/bcl2_pdata"

# Get a list of all .csv files in the directory
csv_files <- list.files(path = directory, pattern = "\\.csv$", full.names = TRUE)

# Loop through the files and import them as data frames
for (file in csv_files) {
  # Extract the file name without the path and remove the last 4 characters
  data_name <- substr(basename(file), 1, nchar(basename(file)) - 9)
  
  # Import the .csv file and assign it to a variable with the trimmed name
  assign(data_name, read.csv(file))
}

print("Images imported")



# Combine df to a list ----


l_1A <- list(p74 = bcl2_p74_1A, p75 = bcl2_p75_1A, p77 = bcl2_p77_1A)

l_1B <- list(p79 = bcl2_p79_1B, p80 = bcl2_p80_1B, p81 = bcl2_p81_1B)

l_7A <- list(p85 = bcl2_p85_7A, p87 = bcl2_p87_7A, p88 = bcl2_p88_7A)

l_7B <- list(p90 = bcl2_p90_7B, p91 = bcl2_p91_7B, p92 = bcl2_p92_7B)

l_11A <- list(p93 = bcl2_p93_11A, p95 = bcl2_p95_11A, p97 = bcl2_p97_11A)

l_11B <- list(p102 = bcl2_p102_11B, p103 = bcl2_p103_11B, p104 = bcl2_p104_11B)

print("Lists combined")


# Combine lists to a grand list ----

gl_bcl2.p <- list(l_1A = l_1A, 
               l_1B = l_1B, 
               l_7A = l_7A, 
               l_7B = l_7B, 
               l_11A = l_11A,
               l_11B = l_11B)

print("Lists collected")





