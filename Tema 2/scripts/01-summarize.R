data <- read.csv("data/auto-mpg.csv", header = T, 
                 stringsAsFactors = F)

data$cylinders <- factor(data$cylinders,
                         levels = c(3, 4, 5, 6, 8),
                         labels = c("3cil", "4cil", "5cil", "6cil", "8cil"))
summary(data)

str(data)


summary(data$cylinders)
summary(data$mpg)
str(data$cylinders)


install.packages(c("modeest", "raster", "moments"))

library(modeest) #moda
library(raster) #quantilers, cv
library(moments) #asimetria, curtosis



## Medidas de centralizacion
x = data$mpg
mean(x) #media
median(x)# mediana valor central
mfv(x)# moda
quantile(x)# percentil


## medidas de disperción
var(x)# varianza
sd(x)# desviacion tipica
cv(x)# coeficiente de variacioón

## medidas de simetría
skewness(x) # Asimetria
moments::kurtosis(x) # Coeficiente de curtosis

hist(x)
