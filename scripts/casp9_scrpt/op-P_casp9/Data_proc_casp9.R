



# Import the entire folder .csv ----

# Set the directory containing the files
directory <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/data/casp9_pdata"

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

l_1A <- list(p73 = casp9_p73_1A, p74 =casp9_p74_1A, p76 = casp9_p76_1A)

l_1B <- list( p80 = casp9_p80_1B, p81 = casp9_p81_1B, p82 = casp9_p82_1B )

l_7A <- list( p85 = casp9_p85_7A, p86 = casp9_p86_7A, p89 = casp9_p89_7A)

l_7B <- list( p93 = casp9_p93_7B, p94 = casp9_p94_7B, p96 = casp9_p96_7B)

l_11A <- list( p98 = casp9_p98_11A, p100 = casp9_p100_11A, p101 = casp9_p101_11A)

l_11B <- list( p107 = casp9_p107_11B, p108 = casp9_p108_11B, p109 = casp9_p109_11B)

print("Lists combined")


# Combine lists to a grand list ----

gl_casp9.p <- list(
  l_1A = l_1A,
  l_1B = l_1B,
  l_7A = l_7A,
  l_7B = l_7B,
  l_11A = l_11A,
  l_11B = l_11B
)

print("Lists collected")
