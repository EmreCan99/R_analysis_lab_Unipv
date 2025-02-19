


bax_p84_1A <- read.csv("data/bax_p84_1A_od-p.csv")
bax_p85_1A <- read.csv("data/bax_p85_1A_od-p.csv")

bax_p87_1B <- read.csv("data/bax_p87_1B_od-p.csv")
bax_p88_1B <- read.csv("data/bax_p88_1B_od-p.csv")

bax_p92_7A <- read.csv("data/bax_p92_7A_od-p.csv")
bax_p93_7A <- read.csv("data/bax_p93_7A_od-p.csv")

bax_p96_7B <- read.csv("data/bax_p96_7B_od-p.csv")
bax_p97_7B <- read.csv("data/bax_p97_7B_od-p.csv")

# creating a list from dataframes and naming the firt row as index

# bax 1A

bax_1A <- list(p84 = bax_p84_1A, p85 = bax_p85_1A)

i = 1
for (it in bax_1A){
  colnames(bax_1A[[i]])[1] <- "index"
  print(colnames(bax_1A[[i]])[1])
  i <- i + 1
}

# bax 1B

bax_1B <- list(p87 = bax_p87_1B, p88 = bax_p88_1B)

i = 1
for (it in bax_1B){
    colnames(bax_1B[[i]])[1] <- "index"
  print(colnames(bax_1B[[i]])[1])
  i <- i + 1
}

# bax 7A

bax_7A <- list(p92 = bax_p92_7A, p93 = bax_p93_7A)

i = 1
for (it in bax_7A){
  colnames(bax_7A[[i]])[1] <- "index"
  print(colnames(bax_7A[[i]])[1])
  i <- i + 1
}

# bax 7B

bax_7B <- list(p96 = bax_p96_7B, p97 = bax_p97_7B)

i = 1
for (it in bax_7B){
  colnames(bax_7B[[i]])[1] <- "index"
  print(colnames(bax_7B[[i]])[1])
  i <- i + 1
}




