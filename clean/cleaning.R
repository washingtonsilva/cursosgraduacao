# Diretorio de trabalho
setwd("C:\\Users\\polo\\Desktop\\GitHub\\Graduacao\\data.raw")

# Pacotes que serao utilizados
library(readxl)
library(DataExplorer)
library(SmartEDA)
library(dplyr)

# Importando os dados
dados <- read_xlsx("Graduacao.xlsx", na = " ")
names(dados)
str(dados)

# Visao geral dos dados via SmartEDA
ExpData(data = dados, type=1) # Type = 1 - Visao Geral
ExpData(data = dados, type=2) # Type = 2 - Estrutura dos dados

# Convertendo os nomes das variaveis para letras minusculas
# names(dados) <- casefold(names(dados))


# Definindo o tipo de cada variavel

dados$CURSO  <- factor(dados$CURSO)
dados$TURMA_INGRESSO <- factor(dados$TURMA_INGRESSO)
dados$PERIODO_LETIVO<- factor(dados$PERIODO_LETIVO)
dados$MATRICULAS_INICIAS <- as.numeric(dados$MATRICULAS_INICIAS)
dados$EVASÃO <- as.numeric(dados$EVASÃO)
dados$TRANCAMENTO <- as.numeric(dados$TRANCAMENTO)
dados$RETIDOS_CICLO  <- as.numeric(dados$RETIDOS_CICLO)
dados$CONCLUINTES <- as.numeric(dados$CONCLUINTES)
dados$TAXA_DE_EVASAO <- as.numeric(dados$TAXA_DE_EVASAO)
dados$MATRICULADOS_CICLO_TURMA <- as.numeric(dados$MATRICULADOS_CICLO_TURMA)
dados$TAXA_DE_RETENCAO <- as.numeric(dados$TAXA_DE_RETENCAO) 

# Alterando variaveis EVASAO E TAXA DE RETENCAO para % (*100)
dados$TAXA_DE_EVASAO <- dados$TAXA_DE_EVASAO*100
dados$TAXA_DE_RETENCAO <- dados$TAXA_DE_RETENCAO*100

# Verificando a nova estrutura
ExpData(data = dados, type=2) 
plot_missing(dados) 

# Estrutura dos dados com SmartEDA
sink("sink-ExpData.txt")
SmartEDA::ExpData(data = dados, type=1)
SmartEDA::ExpData(data = dados, type=2)
sink()

# Salvando arquivos com miss data 
setwd("C:\\Users\\polo\\Desktop\\GitHub\\Graduacao\\data.analysis")
save(dados, file = "dados_misscomp.RData")
