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

# Transformando em tiblle 

texto_df <- tibble(line = 1:14, text = texto)

## Base Teste - para testar 
teste_primeiras_linhas <- texto_df [1:5,]





# transformando em tokens (quebrando em palavras)



# Excluindo os números que aparecem nos comentários



