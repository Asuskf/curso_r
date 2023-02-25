# Estandarizar o normalizar valores
housing <- read.csv("data/BostonHousing.csv")
housing.none <- scale(housing, center = F, scale = F)

housing.mean <- scale(housing, center = T, scale = F)
housing.sd <- scale(housing, center = F, scale = T)

housing.z <- scale(housing)

scale.many = function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col],
                  "z",
                  sep = ".")
    dataframe[name] <- scale(dataframe[,col])
  }
  
  cat(paste("Hemos normalizado ", 
            length(cols), " variable(s)"
            )
      )
  dataframe
}
housing <- scale.many(housing, c(1, 3, 5:8))

names(housing)
