auto <- read.csv("data/auto-mpg.csv",
                 stringsAsFactors = F)
auto$cylinders <- factor(auto$cylinders,
                         levels = c(3, 4, 5, 6, 8),
                         labels = c("3C", "4C", "5C", "6C", "8C")
                         )
#install.packages("lattice")

library(lattice)
attach(auto)

#box plot
bwplot(~mpg | cylinders,
       main = "MPG según cilindrada",
       xlab = "MIllaspor galeón",
       layout = c(3, 2), aspect = 1)

#scatter plot
xyplot(mpg~weight | cylinders, data = auto,
       main = "Peso vs conumo vs cilindrad",
       xlab = "Peso", 
       ylab = "Consumo (mpg)"
       )
# bwplot, xyplot, densityplot, splom

trellis.par.set(theme = col.whitebg())
