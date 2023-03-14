
####################### Plots  ######################### 


plot_density <-
  mydata %>% filter( log(ytotcor)>10 & log(ytotcor)<16 ) %>% 
  ggplot(aes(x=as.numeric(esc), y=log(ytotcor))) +
  geom_density_2d_filled() +
  labs(subtitle="Distribución conjunta educación e ingreso", x="Escolaridad", y="log(Ingreso)") +
  scale_y_continuous(labels = scales::dollar_format()) +
  scale_fill_pomological() +
  facet_grid(. ~ genero) + 
  theme_pomological("Homemade Apple", 16) +
  theme(legend.position = "none")

setwd(dirresults)
dir <- paste0(dirresults,"plot_density.png")
ggsave(dir, plot_density, width = 15, height = 10, units = "cm")



################ Modelos de Regresión ################## 


# Fit linear model

model1 <- lm(log(ytotcor) ~ esc + genero, data=mydata)


# Update modelo existente 
model2 <- update(model1, . ~ . + genero*esc)



# exportar resultados a una linda tabla 

dir <- paste0(dirresults,"miprimeratabladeregresion.tex")


stargazer(model1, model2, type="latex",
          covariate.labels=c("Escolaridad","Mujer","Escolaridad*Mujer","Intercepto"),
          dep.var.labels=c("log(Ingreso)","log(Ingreso)"),
          out=dir)


cat("================ ANÁLISIS LISTOS !!!! ====================") # Debugging flags


