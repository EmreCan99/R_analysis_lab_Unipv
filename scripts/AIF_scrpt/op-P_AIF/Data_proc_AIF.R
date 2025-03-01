
# Import the entire folder .csv ----

# Set the directory containing the files
directory <- "/Users/emrecanciftci/betik/R_projects/lab_data_unipv/data/AIF_pdata"

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


l_1A <- list(p73 = AIF_p73_1A, p76 = AIF_p76_1A, p77 = AIF_p77_1A)

l_1B <- list(p78 = AIF_p78_1B, p79 = AIF_p79_1B, p80 = AIF_p80_1B)

l_7A <- list(p83 = AIF_p83_7A, p84 = AIF_p84_7A, p86 = AIF_p86_7A)

l_7B <- list(p87 = AIF_p87_7B, p89 = AIF_p89_7B, p90 = AIF_p90_7B)

l_11A <- list(p91 = AIF_p91_11A, p93 = AIF_p93_11A, p95 = AIF_p95_11A)

l_11B <- list(p97 = AIF_p97_11B, p98 = AIF_p98_11B, p100 = AIF_p100_11B)

print("Lists combined")


# Combine lists to a grand list ----

gl_AIF.p <- list(l_1A = l_1A, 
               l_1B = l_1B, 
               l_7A = l_7A, 
               l_7B = l_7B, 
               l_11A = l_11A,
               l_11B = l_11B)

print("Lists collected")





