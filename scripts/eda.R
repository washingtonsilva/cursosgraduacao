# Carregando os dados_grad_grad preparados para analise
setwd("C:\\Users\\polo\\Desktop\\GitHub\\Graduacao\\data.analysis")
load("dados_tec.RData")

# Pacotes que serao utilizados
library(tidyverse)

# Selecionando CURSO via dplyr::filter()

Engenharia <- filter(dados_grad, curso == "ENGENHARIA")
Engenharia

Matematica <- filter(dados_grad, curso == "MATEMÁTICA")
Matematica 

# ggplot2 e ggplotly

#########################################################################
##                    ENGENHARIA ELETRICA                              ##
#########################################################################

#### Matriculas Inicais
p1 <- ggplot(data = Engenharia, aes(x = periodo_letivo, y = matriculas_iniciais, group = curso)) + geom_point() + geom_line() 

p1 <- p1 + labs(title = "Matrículas Iniciais por Período Letivo",
           subtitle = "Conceito: Total de alunos matriculados por período letivo") +
                 labs(x = "Período Letivo", y = "Alunos Matriculados")

# Theme: The Economist
p1 <-  p1 + theme_economist() + theme(axis.line.x = element_line(size = .5, colour = "black"))
p1
ggplotly(p1)

# Theme: Five Thirty Eight
p1 <-  p1 + theme_fivethirtyeight() + theme(axis.line.x = element_line(size = .5, colour = "black"))
p1
ggplotly(p1)

# Theme: Wall Street Journal
p1 <-  p1 + theme_wsj() + theme(axis.line.x = element_line(size = .5, colour = "black"))
p1
ggplotly(p1)

## Concluintes
p2 <- ggplot(data = Engenharia, aes(x = periodo_letivo, y = concluintes, group = curso)) + geom_point() + geom_line() 
ggplotly(p2)

## Trancamento
p3 <- ggplot(data = Engenharia, aes(x = periodo_letivo, y = trancamento, group = curso)) + geom_point() + geom_line() 
ggplotly(p3)

## Retencao
p4 <- ggplot(data = Engenharia, aes(x = periodo_letivo, y = retidos, group = curso)) + geom_point() + geom_line() 
ggplotly(p4)

## Evasao absoluta
p5 <- ggplot(data = Engenharia, aes(x = periodo_letivo, y = evasao, group = curso)) + geom_point() + geom_line() 
ggplotly(p5)

## Taxa de Evasao 
p6 <- ggplot(data = Engenharia, aes(x = periodo_letivo, y = taxa_evasao, group = curso)) + geom_point() + geom_line() 
ggplotly(p6)

