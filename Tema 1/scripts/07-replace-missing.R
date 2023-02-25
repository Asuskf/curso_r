data <- read.csv("data/missing-data.csv", na.string = "")

data$Income[data$Income==0] <- NA

# Remplazar NA pro promedio

data$Income.mean <- ifelse(is.na(data$Income), 
                           mean(data$Income, na.rm = T),
                           data$Income
                           )

# X vector de datos que puede tener valores NA
random.impute <- function(x){
  # contiene un vector booleano T o F
  missing <- is.na(x)
  # Sumar NA dentro de x
  n.missing <- sum(missing)
  # Valores que tienen dato diferente de NA en X
  x.obs <- x[!missing]
  # por defcto el vector de entrada 
  imputed <- x
  # Devover los NA remplazado por una muestra de los que si conocemos (MAS)
  imputed[missing] <- sample(x.obs, 
                             n.missing,
                             replace = T
                             )
  return(imputed)
}

random.imputed.data.frame <- function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col], 
                  ".imputed",
                  sep = ""
                  )
    dataframe[name] = random.impute(dataframe[, col])
  }
  return(dataframe)
}

data <- random.imputed.data.frame(data, c(1, 2))
