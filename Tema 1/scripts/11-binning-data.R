students <- read.csv("data/data-conversion.csv")

bp <- c(-Inf, 10000, 31000, Inf)
names <- c("Low", "Avergae", "High")

students$income.cat <- cut(students$Income, breaks = bp, labels = names)

students$income.cat2 <- cut(students$Income, breaks = bp)


students$income.cat3 <- cut(students$Income, breaks = 4,
                            labels = c("Lvl 1", "Lvl 2",
                                       "Lvl 3", "Lvl 4")
                            )
# dummy variables
#install.packages("fastDummies")
library(fastDummies)

students <- read.csv("data/data-conversion.csv")
students.dammy <- dummy_cols(students)

