ozone.data <- read.csv("data/ozone.csv", stringsAsFactors = F)

boxplot(ozone.data$pressure_height,
        main = "Pressure hight",
        boxwex = 0.5)$out

summary(ozone.data)

boxplot(pressure_height ~ Month,
        data = ozone.data, 
        main = "Pressure height per Month"
        )

boxplot(ozone_reading ~ Month,
        data = ozone.data,
        main = "Ozone reading per Month"
        )$out

mtext("hola")



impute_ouliers <- function(column, removeNA = T){
  quantiles <- quantile(column, c(0.05, 0.95), na.rm = removeNA)
  column[column < quantiles[1]] <- mean(column, na.rm = removeNA)
  column[column > quantiles[2]] <- mean(column, na.rm = removeNA)
  column
  
}

impute_data <- impute_ouliers(ozone.data$pressure_height)

par(mfrow = c(1, 2))

boxplot(ozone.data$pressure_height,
        main = "Presión con outliers")

boxplot(impute_data,
        main = "Presión sin outliers")


repla_ouliers <- function(column, removeNA = T){
  qrts <- quantile(column, probs = c(0.25, 0.75), na.rm = removeNA)
  caps <- quantile(column, probs = c(0.05, 0.95), na.rm = removeNA)
  iqr <- qrts[2] - qrts[1]
  h <- 1.5 * iqr
  column[column < qrts[1] - h] <- caps[1]
  column[column > qrts[2] + h] <- caps[2]
  column
}

capped_pressure_hight <- repla_ouliers(ozone.data$pressure_height)

par(mfrow = c(1,2))
boxplot(ozone.data$pressure_height, 
        main="Presión con outliers"
        )
boxplot(capped_pressure_hight, 
        main="Presión sin outliers"
)




