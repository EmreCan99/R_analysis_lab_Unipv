
# Import the entire folder .csv ----

# Set the directory containing the files
directory <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/data/casp8_pdata"

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


l_1A <- list( p79 = casp8_p79_1A, p80 = casp8_p80_1A, p83 = casp8_p83_1A, p84 = casp8_p84_1A)

l_1B <- list( p85 = casp8_p85_1B, p87 = casp8_p87_1B, p89 = casp8_p89_1B, p90 = casp8_p90_1B)

l_7A <- list( p91 = casp8_p91_7A, p93 = casp8_p93_7A, p96 = casp8_p96_7A)

l_7B <- list( p100 = casp8_p100_7B, p101 = casp8_p101_7B, p102 = casp8_p102_7B)

l_11A <- list( p104 = casp8_p104_11A, p105 = casp8_p105_11A, p108 = casp8_p108_11A, p110 = casp8_p110_11A)

l_11B <- list( p111 = casp8_p111_11B, p112 = casp8_p112_11B, p113 = casp8_p113_11B, p115 = casp8_p115_11B )

print("Lists combined")


# Combine lists to a grand list ----

gl_casp8.p <- list(
  l_1A = l_1A,
  l_1B = l_1B,
  l_7A = l_7A,
  l_7B = l_7B,
  l_11A = l_11A,
  l_11B = l_11B
)

print("Lists collected")
