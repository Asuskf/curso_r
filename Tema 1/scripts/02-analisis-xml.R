#install.packages("XML")
library(XML)
url <- "Tema 1/data/cd_catalog.xml"

xmldoc <- xmlParse(url) #XMLInternalDocument
rootnode <- xmlRoot(xmldoc) 
rootnode[1]

cds_data <- xmlSApply(rootnode, function(x) xmlSApply(x, xmlValue) )
cds.catalog <- data.frame(t(cds_data), row.names = NULL)
head(cds.catalog, 2)
cds.catalog[1:5,]

# html 

population_url <- "Tema 1/data/WorldPopulation-wiki.htm"
tables <- readHTMLTable(population_url)
most_populated <- tables[[6]]
head(most_populated, 3)


custom_table <- readHTMLTable(population_url, which = 6)
