
# Carregando os dados_grad_grad preparados para analise
setwd("C:\\Users\\polo\\Desktop\\GitHub\\Graduacao\\data.analysis")
load("dados_tec.RData")

# Pacotes que serao utilizados
library(tidyverse)

# Selecionando CURSO via dplyr::filter()

adm <- filter(dados_tec, curso == "Técnico em Administração Integrado")
save(adm, file = "tec_adm.RData")

eletro <- filter(dados_tec, curso == "Técnico em Informática Integrado")
save(eletro, file = "tec_eletro.RData")

info <- filter(dados_tec, curso == "Técnico em Eletrotécnica Integrado")
save(info, file = "tec_info.RData")
