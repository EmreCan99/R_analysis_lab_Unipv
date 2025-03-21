library("foreign")
library("lsr")

options(scipen = 999) # to turnf OFF scientific notation. to open (scipen = 0)

load( "aflsmall.Rdata" )

bax_p84_1A <- read.csv("bax_p84_1A_od-p.csv")
bax_p85_1A <- read.csv("bax_p85_1A_od-p.csv")

str(bax_p84_1A) # info
summary(bax_p84_1A)

# Trimmed mean

dataset <- c(-15,2,3,4,5,6,7,8,9,12)

mean(dataset)
# 4.1
median(dataset)
# 5.5

mean(dataset, trim = .1)
# 5.5

quantile(x = dataset, probs = c(0.25, 0.5, 0.75))
# 25%  50%  75% 
# 3.25 5.50 7.75 

IQR(dataset) # Interquatile Range
# 4.5

X <- c(56, 31,56,8,32) 

paste(
  round(mean(bax_p84_1A$Mean), 2), 
  " : ",
  round(mean(bax_p85_1A$Mean)))

# Data visualiton

data(iris)

# Plot
IrisPlot <- ggplot(iris, aes(Sepal.Length, Petal.Length, colour = Species)) + geom_point()

print(IrisPlot)

print(IrisPlot + labs(y="Petal length (cm)", x = "Sepal length (cm)") 
      + ggtitle("Petal and sepal length of iris"))

# Working with axes
p <- ggplot(iris, aes(Sepal.Length, Petal.Length, colour = Species)) + geom_point()
p

p + annotate("rect", xmin = 5, xmax = 6, ymin = 0, ymax = 10,
             alpha = .2, colour = "red")

# Try my own data

bax_plot <- ggplot(bax_p84_1A[2:15,], aes(x = X, y = Mean)) + geom_point()

bax_plot + annotate("segment", y = 100, x = 0, xend = 15, colour = "red")
bax_plot + labs(x = "Cell", y = "Mean Grey Value (OP)") + ggtitle("Bax 1A Purkinje Cells Optic Density")

#--- 

bax_dist <- ggplot(bax_p84_1A[2:15,], aes(x = Mean)) + geom_density()
bax_dist

library(hrbrthemes)

bax_hist <- ggplot(bax_p84_1A[2:15,], aes(x = Mean)) + geom_histogram(binwidth = 3, fill="#69b3a2", color="#e9ecef", alpha=0.9)

bax_hist



# get the means to compare

bound_names <- c()

data_combined <- bind_rows(
  lapply(names(gl_bax.p$l_11B), function(name) {
    bound_names <<- c(bound_names, name)  # Collect the names of data frames
    gl_bax.p$l_11B[[name]]
  }),
  .id = "source"  # Add "source" column to track origin
)

print(mean(data_combined$Mean))
m11B <- mean(data_combined$Mean)





# Retrieve

plot_data <- svd_AIF_plt_A

svd_AIF_plt_A <- readRDS("analysis/raw_rds/bcl2_ip_1A_7A_11A_plot_data.p.rds")
svd_AIF_plt_B <- readRDS("analysis/raw_rds/bcl2_ip_1B_7B_11B_plot_data.p.rds")



