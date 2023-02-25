#install.packages("tidyr")
library(tidyr)


crime.data <- read.csv("data/USArrests.csv", stringsAsFactors = F)

#unir 

head(crime.data)

crime.data <- cbind(state = rownames(crime.data),
                    crime.data)

crime.data.1 = gather(crime.data, 
                      key = "crime_type",
                      value = "arrest_estimate", 
                      Murder : UrbanPop)

crime.data.2 = gather(crime.data, 
                      key = "crime_type",
                      value = "arrest_estimate", 
                      -state )

crime.data.3 = gather(crime.data, 
                      key = "crime_type",
                      value = "arrest_estimate", 
                      Murder, Assault )
# Separar
crime.data.4 <- spread(crime.data.2, 
                       key = "crime_type",
                       value = "arrest_estimate")

#unir columnas
crime.data.5 <- unite(crime.data,
                     col = "Muder_Assault",
                     Murder, Assault,
                     sep = "_")

# seprar columna con seprarador
crime.data.6 <- separate(crime.data.5, 
                         col = "Muder_Assault", 
                         into = c("Murder", "Assault"),
                         sep = "_")
