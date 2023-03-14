
# crea nueva variable: cohorte de nacimiento

mydata <- mydata %>% mutate(cohorte_nacimiendo = 2017 - edad)


# recodifica variable existente

mydata <- mydata %>% mutate(genero = case_when(sexo==1 ~ "Hombre", sexo==2 ~ "Mujer"))


cat("================ RECODIFICACIÓN LISTA !!!! ====================") # Debugging flags

