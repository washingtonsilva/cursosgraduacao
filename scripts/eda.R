# Carregando os dados_grad_grad preparados para analise
setwd("C:\\Users\\polo\\Desktop\\GitHub\\Graduacao\\data.analysis")
load("dados_grad_grad_misscomp.RData")

# Pacotes que serao utilizados
library(tidyverse)
library(ggplot2)
library(plotly)
library(gganimate)


# Selecionando CURSO via dplyr::filter()

Engenharia <- filter(dados_grad, curso == "ENGENHARIA")
Engenharia

Matematica <- filter(dados_grad, curso == "MATEMÁTICA")
Matematica 

# ggplot2

#### Matriculas Inicais
p1 <- ggplot(data = Engenharia, aes(x = periodo_letivo, y = matriculas_iniciais, group = curso)) + geom_point() + geom_line() 
ggplotly(p1)

p1 <- ggplot(data = Matematica, aes(x = periodo_letivo, y = matriculas_iniciais, group = curso)) + geom_point() + geom_line() 
ggplotly(p1)

#### Matriculas Inicais
p2 <- ggplot(data = Engenharia, aes(x = periodo_letivo, y = cumsum(matriculas_iniciais), group = curso)) + geom_point() + geom_line() 
ggplotly(p2)



