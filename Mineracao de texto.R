###########################################################
# MINERAÇÃO DE TEXTO - COLEGIO PARTICULAR 
###########################################################

# Carregando os pacotes/bibliotecas

library("dplyr")
library("tidytext")
library("ggplot2")
library("tibble")
library("wordcloud")
library("stringr")
library("SnowballC")

# Criando um data frame só com os comentarios

comentario <- Tabela_de_Comentarios %>% select(Comentário)

# Transformando os comentarios em um vetor de caracteres

texto <- comentario [-c(2:4,6,19:29),]

# Excluindo os números que aparecem nos comentários

