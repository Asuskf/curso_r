housing.data <- read.csv("data/housing-with-missing-value.csv", 
                         header = T, stringsAsFactors = F)
summary(housing.data)

#Eliminar todos los NA
housing.da.1 <- na.omit(housing.data)
summary(housing.da.1)

## Eliminar NA de una columna
drop_na <- c("rad")
housing.da.2 <- housing.data[
  complete.cases(housing.data[,!(names(housing.data))%in% drop_na]),]
                             
summary(housing.da.2)

## Eliminar toda una columna
housing.data$rad <- NULL
summary(housing.data)

## Eliminar varias columnas
drops <- c("rad", "ptratio")
housing.data3 <- housing.data[,!(names(housing.data) %in% drops)]
summary(housing.data3)

#install.packages("Hmisc")
library(Hmisc)

# ramplazr na por media
housing.data.copy1 <- housing.data
housing.data.copy1$ptratio <- impute(housing.data.copy1$ptratio, mean)
housing.data.copy1$rad <- impute(housing.data.copy1$rad, mean)
summary(housing.data.copy)

# ramplazr na por mediana
housing.data.copy2 <- housing.data
housing.data.copy2$ptratio <- impute(housing.data.copy1$ptratio, median)
housing.data.copy2$rad <- impute(housing.data.copy1$rad, median())
summary(housing.data.copy2)

# ramplazr na por valor predefinido
housing.data.copy3 <- housing.data
housing.data.copy3$ptratio <- impute(housing.data.copy3$ptratio, 18)
housing.data.copy3$rad <- impute(housing.data.copy3$rad, 7)
summary(housing.data.copy3)

#install.packages("mice")
library(mice)
md.pattern(housing.data)


#install.packages("VIM")
library(VIM)

aggr(housing.data,
     col = c("Green", "Red"),
     numbers = T,
     sortVars = T, 
     labels = names(housing.data),
     cex.axis = 0.75, 
     gap = 1, 
     ylab = c("Histograma de NAs", 
              "Patrón")
     )
