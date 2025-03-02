
# Import the entire folder .csv ----

# Set the directory containing the files
directory <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/data/casp3_pdata"

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


l_1A <- list(p54 = casp3_p54_1A, p57 = casp3_p57_1A, p58 = casp3_p58_1A)

l_1B <- list(p60 = casp3_p60_1B, p62 = casp3_p62_1B, p63 = casp3_p63_1B)

l_7A <- list(p68 = casp3_p68_7A, p69 = casp3_p69_7A, p70 = casp3_p70_7A)

l_7B <- list(p71 = casp3_p71_7B, p73 = casp3_p73_7B, p74 = casp3_p74_7B)

l_11A <- list(p76 = casp3_p76_11A, p77 = casp3_p77_11A, p79 = casp3_p79_11A)

l_11B <- list(p83 = casp3_p83_11B, p86 = casp3_p86_11B, p87 = casp3_p87_11B)

print("Lists combined")


# Combine lists to a grand list ----

gl_casp3.p <- list(l_1A = l_1A, 
               l_1B = l_1B, 
               l_7A = l_7A, 
               l_7B = l_7B, 
               l_11A = l_11A,
               l_11B = l_11B)

print("Lists collected")





