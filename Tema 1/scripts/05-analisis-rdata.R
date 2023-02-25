clientes <- c("Juan Gabriel", "Ricardo", "Pedro")
fechas <- as.Date(c("2017-12-27", "2017-11-01", "2018-01-01"))
pago <- c(315, 192.55, 40.15)
pedidos <- data.frame(clientes, fechas, pago)


clientes_vip <- c("Juan Gabriel", "Ricardo")

save(pedidos, clientes_vip, file = "data/pedidos_amazon.Rdata")
saveRDS(pedidos, file = "data/pedidos_amazon.rds")

remove(pedidos)


#Rdata 
load("data/pedidos_amazon.Rdata")

#RDS
orders <- readRDS("data/pedidos_amazon.rds")


# read datasets de R
data(iris)
data(cars)

#guardar todos los objetos de la sesión

save.image(file = "data/alldata_kevin.Rdata")

primes <- c(2, 3, 5, 7, 11, 13)
pow2 = c(2, 4, 8, 16, 32, 64, 128)
save(list = c("primes", "pow2"), 
     file = "data/primes_pow2_Rdata"
     )
#aviso de sobre escritura de variables

attach("data/alldata_kevin.Rdata")

#ver variables de entorno
data()
