
################################################## Preámbulo #################################################

# Limpiar pantalla y remover objetos existentes
cat("\014") 
rm(list = ls())

# Carga paquetes
library("readstata13")
library("tidyverse")
library("ggpomological")
library("stargazer")

################################################# Directorios #################################################


# Change the line below to set your own working directory


folder <- "/Users/Mauricio/Library/Mobile Documents/com~apple~CloudDocs/Teaching/ISUC/2023_1_workshop_workflow/workflow_r/"

dircode     <- paste0(folder,"code/") 
dirdata 	<- paste0(folder,"data/") 
dirresults  <- "/Users/Mauricio/Dropbox/Apps/Overleaf/Workflow/"


############################################# Importar datos ################################################# 


# Set working directory
setwd(dirdata)

mydata <- read.dta13("sample_casen2017.dta", convert.factors=FALSE)


############################################ Recodificación #################################################

# Llama otro R script
# Organizar el trabajo de esta manera permite que el código sea más legible y manejable.

# Establece el directorio de trabajo correspondiente
setwd(dircode)
source("2_recoding.R")


############################################## Data analysis #################################################


# Set working directory
setwd(dircode)
source("3_analyses.R")
