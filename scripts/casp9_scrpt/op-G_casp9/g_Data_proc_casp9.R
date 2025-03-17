
# For Granular cells

# Import the entire folder .csv ----

# Set the directory containing the files
directory <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/data/casp9_gdata"

# Get a list of all .csv files in the directory
csv_files <- list.files(path = directory,
                        pattern = "\\.csv$",
                        full.names = TRUE)

# Loop through the files and import them as data frames
for (file in csv_files) {
  # Extract the file name without the path and remove the last 4 characters
  data_name <- substr(basename(file), 1, nchar(basename(file)) - 9)
  
  # Import the .csv file and assign it to a variable with the trimmed name
  assign(data_name, read.csv(file))
}

print("Images imported")



# Combine df to a list ----


l_1A <- list( p13 = casp9_p13_1A)

l_1B <- list( p21 = casp9_p21_1B)

l_7A <- list( p33 = casp9_p33_7A)

l_7B <- list( p46 = casp9_p46_7B)

l_11A <- list( p58 = casp9_p58_11A)

l_11B <- list( p66 = casp9_p66_11B)

print("Lists combined")


# Combine lists to a grand list ----

gl_casp9.g<- list(
  l_1A = l_1A,
  l_1B = l_1B,
  l_7A = l_7A,
  l_7B = l_7B,
  l_11A = l_11A,
  l_11B = l_11B
)

print("Lists collected")
