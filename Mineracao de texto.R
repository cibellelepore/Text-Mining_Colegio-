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
library("quanteda")
library("tm")
library("NLP")


# Criando um data frame só com os comentários

comentario <- Tabela_de_Comentarios %>% select(Comentário)

# Transformando os comentarios em um vetor de caracteres, 
# excluindo as linhas que não possuem comentários.

comentario_atualizado <- comentario [-c(2:4,6,19:29),]

####################################################
# TESTE COM CONTEUDO DIFERENTE DA AULA # 

getSources()
getReaders()

comentarios_corpus = VCorpus(DirSource("C:/Users/CaeCi/Desktop/PROJETO EM DADOS/Text-Mining_Colegio-/Pasta com os comentarios",
                                       encoding ="UTF-8"),readerControl = list(reader=readDOC(e)))



stopwords("portuguese")

comentarios_corpus = tm_map(comentarios_corpus, removeWords,stopwords("portuguese"))

comentarios_corpus = tm_map(comentarios_corpus,stripWhitespace)

comentarios_corpus = tm_map(comentarios_corpus, removePunctuation)

comentarios_corpus = tm_map(comentarios_corpus,removeNumbers)

comentarios_corpus = tm_map(comentarios_corpus, content_transformer(tolower))

# Gerar a Matriz 

tdm = TermDocumentMatrix(comentarios_corpus)

matrix_tdm = as.matrix(tdm)
matrix_tdm



###################################################################
# Transformando em tiblle 

texto_tibble <- tibble(line = 1:14, text = comentario_atualizado)

## Base Teste - para testar 
teste_primeiras_linhas <- comentario_atualizado [1:5,]


tok <- tokens(comentario_atualizado)



dim(teste_primeiras_linhas)

str(comentario_atualizado)
# transformando em tokens (quebrando em palavras)



# Excluindo os números que aparecem nos comentários



