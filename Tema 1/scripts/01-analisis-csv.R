
auto <- read.csv("Tema 1/data/auto-mpg.csv",
                 header = TRUE, sep = ",")
names(auto)
# read.csv2 == read.csv("filename", sep";", dec = ",")

auto_no_header <- read.csv("Tema 1/data/auto-mpg-noheader.csv", 
                           header = FALSE)
head(auto_no_header, 4)

auto_no_sense <- read.csv("Tema 1/data/auto-mpg-noheader.csv")
head(auto_no_sense, 4)

auto_custom_header = read.csv("Tema 1/data/auto-mpg-noheader.csv",
                              header = F,
                              col.names = c("numero", "millas_por_galeon",
                                            "cilindrada", "desplazamiento", 
                                            "caballos_de_potencia", "peso", 
                                            "aceleracion", "año", "modelo")
                              )
head(auto_custom_header, 2)

# NA : not available
# na.strings = ""
# as.character()
auto_custom_header = read.csv("Tema 1/data/auto-mpg-noheader.csv",
                              header = F,
                              stringsAsFactors = F,
                              col.names = c("numero", "millas_por_galeon",
                                            "cilindrada", "desplazamiento", 
                                            "caballos_de_potencia", "peso", 
                                            "aceleracion", "año", "modelo")
)

who_from_internet <- read.csv("http://frogames.es/course-contents/r/intro/tema1/WHO.csv")
