
# For Granular cells

# Import the entire folder .csv ----

# Set the directory containing the files
directory <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/data/casp8_gdata"

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


l_1A <- list( p5 = casp8_p05_1A)

l_1B <- list( p25 = casp8_p25_1B)

l_7A <- list( p36 = casp8_p36_7A)

l_7B <- list( p51 = casp8_p51_7B)

l_11A <- list( p6 = casp8_p64_11A)

l_11B <- list( p69 = casp8_p69_11B)

print("Lists combined")


# Combine lists to a grand list ----

gl_casp8.g<- list(
  l_1A = l_1A,
  l_1B = l_1B,
  l_7A = l_7A,
  l_7B = l_7B,
  l_11A = l_11A,
  l_11B = l_11B
)

print("Lists collected")
