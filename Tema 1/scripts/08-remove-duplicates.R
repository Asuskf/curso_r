family.salary <- c(4000, 60000, 80000, 60000, 70000, 6000, 70000)
family.size <- c(4, 3, 2, 2, 3, 4, 3)
family.car <- c("Lujo", "Compacto", "Utilitario", "Lujo", 
                "Compacto", "Compacto", "Compacto")
family <- data.frame(family.salary, family.size, family.car)

# Eliminar duplicados
family.unique <- unique(family)

# Detectar duplicadas
duplicated(family)

# Obtener duplicados
family[duplicated(family), ]

