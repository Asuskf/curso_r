data <- read.csv("data/missing-data.csv",
                 na.strings = "")
data.cleaned <- na.omit(data)

# ver NA
is.na(data[4, 2])
is.na(data[4, 1])
is.na(data$Income)

# limpieza selectiva 

## variable income
data.income.cleaned <- data[!is.na(data$Income),]

## filas completas del dataframe
complete.cases(data)
data.cleaned.2 <- data[complete.cases(data),]

## convertir los 0 en NA
data$Income[data$Income == 0] <- NA

# Medidas de centralizacion y dispercion 

## Promedio
mean(data$Income)
mean(data$Income, na.rm = T)

## Desviación 
sd(data$Income)
sd(data$Income, na.rm = T)


