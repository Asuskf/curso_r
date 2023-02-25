auto <- read.csv("data/auto-mpg.csv", stringsAsFactors = F, header = T)
auto$cylinders <- factor(auto$cylinders,
                         levels = c(3, 4, 5, 6, 8),
                         labels = c("3cil", "4cil", "5cil", "6cil", "8cil")
                         )
attach(auto)
head(cylinders)

hist(acceleration)

# Histograma de frecuencias
hist(acceleration, col = rainbow(12),
     main = "Histograma de las aceleraciones",
     xlab = "Aceleración",
     ylab = "Frecuencias",
     breaks = 12
     )


hist(mpg, breaks =16,  prob = T)
lines(density(mpg))

# Box plots
boxplot(mpg, 
        xlab = "Millas por galeón"
        )

boxplot(mpg ~ model_year,
        xlab = "Millas por galeon (por año)")

boxplot(mpg ~ cylinders,
        xlab = "Consumo por numero de cilindros"
        )


# Scatter plot
plot(mpg ~ horsepower, type = "n")
linearmodel <- lm(mpg ~ horsepower)
abline(linearmodel)
# agregar colores para cilindrada 
with(subset(auto, cylinders == "8cil"),
     points(horsepower, mpg, col = "red"))

with(subset(auto, cylinders == "6cil"),
     points(horsepower, mpg, col = "yellow"))

with(subset(auto, cylinders == "5cil"),
     points(horsepower, mpg, col = "green"))

with(subset(auto, cylinders == "4cil"),
     points(horsepower, mpg, col = "blue"))

with(subset(auto, cylinders == "3cil"),
     points(horsepower, mpg))

#matriz scatterplot
pairs(~mpg + displacement + horsepower + weight)

#Combinacion de plots con par

old.par <- par()

old.par
par(mfrow = c(1,2))
with(auto, {
  plot(mpg ~ weight, main = "peso vs consumo")
  plot(mpg ~ acceleration, main = "Aceleración vs Consumo")
}
)
par(old.par)
