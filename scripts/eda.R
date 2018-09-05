# Carregando os dados preparados para analise
setwd("C:\\Users\\polo\\Desktop\\GitHub\\Graduacao\\data.analysis")
load("dados_misscomp.RData")

# Pacotes que serao utilizados
library(tidyverse)
library(ggplot2)
library(plotly)
library(gganimate)


# Selecionando CURSO

Engenharia <- filter(dados, CURSO == "ENGENHARIA")
Engenharia

# ggplot2

ggplot(data = Engenharia, aes(x = PERIODO_LETIVO, y = TAXA_DE_RETENCAO, group = TURMA_INGRESSO)) + geom_point() + geom_line() 

ggplot(data = Engenharia, aes(x = PERIODO_LETIVO, y = CONCLUINTES, group = TURMA_INGRESSO)) + geom_point() + geom_line() 


p <- ggplot(data = Engenharia, aes(x = PERIODO_LETIVO, y = TAXA_DE_RETENCAO, group = TURMA_INGRESSO)) + geom_point() + geom_line() 
ggplotly(p)

p1 <- ggplot(data = Engenharia, aes(x = PERIODO_LETIVO, y = CONCLUINTES, group = TURMA_INGRESSO)) + geom_point() + geom_line() 
ggplotly(p1)

p1 <- ggplot(data = Engenharia, aes(x = PERIODO_LETIVO, y = MATRICULADOS_CICLO_TURMA, group = TURMA_INGRESSO)) + geom_point(aes(color = TURMA_INGRESSO)) + geom_line(aes(color = TURMA_INGRESSO))
ggplotly(p1)

p1 <- ggplot(data = Engenharia, aes(x = PERIODO_LETIVO, y = CONCLUINTES, group = TURMA_INGRESSO)) + geom_point(aes(color = TURMA_INGRESSO)) + geom_line(aes(color = TURMA_INGRESSO))
p1 <- p1 + theme(legend.position="bottom")
ggplotly(p1)
p1

