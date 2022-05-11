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


usuario_1 <- "Excelente escola em todos os sentidos. Minha filha desenvolveu demais. Sem palavras para o
acolhimento e o capricho em tudo o que é feito na escola. Ótimos profissionais!"

usuario_2 <- "O Colégio Sonho Meu trata seus alunos como mais do que crianças, clientes ou pessoas. Os alunos e suas famílias são os parceiros de um Sonho. Sonho de ensinar com  qualidade, de sermos bem cuidados, de formar pessoas de bom caráter e de trabalho em equipe. Agradeço ao Colégio Sonho Meu pelos oito anos que estamos juntos, nos quais pude confiar a vocês a tarefa 
mais importante que é auxiliar meus dois filhos nesse processo lindo que é APRENDER"

usuario_3 <- "Posso dizer que é uma escola que acolhe não somente ao aluno como a todos familiares. Tem uma 
equipe maravilhosa! Só tenho a agradecer por todos esses anos de dedicação."

usuario_4 <- "Foi a minha melhor escolha após muitas pesquisas na região. Quando fui conhecer eu tive a confirmação de que seria naquele ambiente que eu queria que minha filha ficasse. A Marina integrou a família Sonho Meu aos 5 meses. Eu só tenho a agradecer todo o carinho e cuidado recebido no berçário e que se estende até hoje. Tenho total confiança no serviço prestado, profissionais altamente qualificados que fazem tudo com humanização, cuidado e muito amor. Eu só tenho a agradecer por tudo e dizer que SIM recomendo a escola. Nossos pequenos merecem o melhor e o Colégio Sonho Meu oferece além do que esperamos. 
É muito carinho e cuidado com os pequenos e com os pais também. Obrigada"

comentario <- c(usuario_1,usuario_2,usuario_3,usuario_4)

# Transformando em tibble

comentario_df <- tibble(line = 1:4,text = comentario)


# Transformando em token

df <- comentario_df %>% unnest_tokens(word,text)

# Pre - processamento

# Removendo os Stopwords

df <- df %>% anti_join(get_stopwords(language = 'pt'))

# Contar as palavras

df_count <- df %>% select(word) %>% count(word, sort = TRUE)

# Criar a word cloud

paleta_cores <- brewer.pal(12, "Paired")
df_count %>% with(wordcloud(word, n,random.order = FALSE,max.words = 30,colors=paleta_cores))


