#install.packages("jsonlite")
#install.packages("curl")

library(jsonlite)

data.1 <- fromJSON("data/students.json")
data.2 <- fromJSON("data/student-courses.json")

url <- "http://www.floatrates.com/daily/usd.json"
currencies <- fromJSON(url)

currency.data <- currencies$gbp$alphaCode

head(data.1, 3)

data.1$Email
data.1[c(2, 5, 8), ]
data.1[, c(2, 5)]


