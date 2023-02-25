library(mice)

housing.data <- read.csv("data/housing-with-missing-value.csv", header = T, 
                         stringsAsFactors = F)

columns <- c("ptratio", "rad")

imputed_data <- mice(as.data.frame(housing.data[, names(housing.data) %in% columns]), 
                     m = 5,
                     maxit = 50, 
                     method = "pmm",
                     seed = 2018
                     )
## pmm = predictiva de medias
## logreg = regresión logistica
## polyreg = regresión logistica politomicas
## polr - modelo de probabilidades proporcionales

summary(imputed_data)

complete.data <- mice::complete(imputed_data)

housing.data$ptratio <-complete.data$ptratio
housing.data$rad <- complete.data$rad

anyNA(housing.data)

library(Hmisc)
impute_arg <- aregImpute(~ptratio + rad, data = housing.data, n.impute = 5)

