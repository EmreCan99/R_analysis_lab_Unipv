
# For Granular cells

# Import the entire folder .csv ----

# Set the directory containing the files
directory <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/data/casp3_gdata"

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


l_1A <- list( p14 = casp3_p14_1A)

l_1B <- list( p24 = casp3_p24_1B)

l_7A <- list( p30 = casp3_p30_7A)

l_7B <- list( p37 = casp3_p37_7B)

l_11A <- list( p46 = casp3_p46_11A)

l_11B <- list( p52 = casp3_p52_11B)

print("Lists combined")


# Combine lists to a grand list ----

gl_casp3.g<- list(
  l_1A = l_1A,
  l_1B = l_1B,
  l_7A = l_7A,
  l_7B = l_7B,
  l_11A = l_11A,
  l_11B = l_11B
)

print("Lists collected")
