data <- read.csv("data/daily-bike-rentals.csv",
                 stringsAsFactors = F)
data$season <- factor(data$season,
                      levels = c(1, 2, 3, 4),
                      labels = c("Invierno", "primavera", "verano", "otoño")
                      )
data$workingday <- factor(data$workingday,
                          levels = c(0, 1),
                          labels = c("Festivo", "De trabajo")
                          )

data$weathersit <- factor(data$weathersit,
                          levels = c(1, 2, 3),
                          labels = c("Despejado", "NUblado", "Llluvia/ nieve lijera")
                          )

data$dteday <- as.Date(data$dteday, format = "%Y-%m-%d")
attach(data)

par(mfrow = c(2, 2))

winter <- subset(data, season == "Invierno")$cnt
spring <- subset(data, season == "primavera")$cnt
summer <- subset(data, season == "verano")$cnt
fall <- subset(data, season == "otoño")$cnt


hist(winter, prob = T,
     xlab = "Alquiler en invierno")
lines(density(winter))
abline(v = mean(winter), col = "red")
abline(v = median(winter), col = "blue")


hist(spring, prob = T,
     xlab = "Alquiler en primavera")
lines(density(spring))
abline(v = mean(spring), col = "red")
abline(v = median(spring), col = "blue")


hist(summer, prob = T,
     xlab = "Alquiler en verano")
lines(density(summer))
abline(v = mean(summer), col = "red")
abline(v = median(summer), col = "blue")


hist(fall, prob = T,
     xlab = "Alquiler en otoño")
lines(density(fall))
abline(v = mean(fall), col = "red")
abline(v = median(fall), col = "blue")

#install.packages("beanplot")
library(beanplot)
par(mfrow = c(1, 1))
beanplot(data$cnt ~ data$season, 
         col = c("blue", "red", "yellow"))


# causalidad
library(lattice)
bwplot(cnt ~ weathersit, data = data,
       layout = c(1, 1),
       xlab = "Pronostico del tiempo",
       ylab = "Frecuencia",
       panel = function(x, y, ...){
         panel.bwplot(x,y, ...)
         panel.stripplot(x, y, jitter.data = T, ...)
         
       },
       par.settings = list(box.rectangle = list(fill = c("red", "yellow", "green"))))
