# split/unsplit

data <- read.csv("data/auto-mpg.csv", header = T, 
                 stringsAsFactors = F)

carslist <- split(data, data$cylinders)

carslist[1]
carslist[[1]]

str(carslist[1])
str(carslist[[1]])

names(carslist[1])
names(carslist[[1]])


