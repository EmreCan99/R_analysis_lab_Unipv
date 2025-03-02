



# Import the entire folder .csv ----

# Set the directory containing the files
directory <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/data/bax_pdata"

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


l_1A <- list(p84 = bax_p84_1A, p85 = bax_p85_1A, p86 = bax_p86_1A)

l_1B <- list(
  p87 = bax_p87_1B,
  p88 = bax_p88_1B,
  p89 = bax_p89_1B,
  p90 = bax_p90_1B
)

l_7A <- list(
  p92 = bax_p92_7A,
  p93 = bax_p93_7A,
  p94 = bax_p94_7A,
  p95 = bax_p95_7A
)

l_7B <- list(p96 = bax_p96_7B, p97 = bax_p97_7B, p98 = bax_p98_7B)

l_11A <- list(p100 = bax_p100_11A, p102 = bax_p102_11A, p103 = bax_p103_11A)

l_11B <- list(
  p106 = bax_p106_11B,
  p107 = bax_p107_11B,
  p108 = bax_p108_11B,
  p109 = bax_p109_11B
)

print("Lists combined")


# Combine lists to a grand list ----

gl_bax.p <- list(
  l_1A = l_1A,
  l_1B = l_1B,
  l_7A = l_7A,
  l_7B = l_7B,
  l_11A = l_11A,
  l_11B = l_11B
)

print("Lists collected")
