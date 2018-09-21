
setwd("C:\\Users\\polo\\Desktop\\GitHub\\Graduacao\\reports\\tec_administracao")

load("dados_tec.RData")

library(tidyverse)
library(DT)
library(ggplot2)
library(plotly)

adm <- filter(dados_tec, curso == "Técnico em Administração Integrado")


datatable(adm, rownames = FALSE,
  options = list(
    initComplete = JS(
      "function(settings, json) {",
      "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
      "}"),
    language = list(url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Portuguese.json')
  ))

