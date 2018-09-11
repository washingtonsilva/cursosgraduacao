# Diretorio de trabalho
setwd("C:\\Users\\polo\\Desktop\\GitHub\\Graduacao\\data.raw")

# Pacotes que serao utilizados
library(readxl)
library(DataExplorer)
library(SmartEDA)
library(dplyr)

# Importando os dados
dados_tec <- read_xlsx("tecnico_consolidado.xlsx")
names(dados_tec)
str(dados_tec)

# Visao geral dos dados via SmartEDA
ExpData(data = dados_tec, type=1) # Type = 1 - Visao Geral
ExpData(data = dados_tec, type=2) # Type = 2 - Estrutura dos dados

# Convertendo os nomes das variaveis para letras minusculas
# names(dados) <- casefold(names(dados))

# Definindo o tipo de cada variavel

dados_tec$curso  <- factor(dados_tec$curso)
dados_tec$periodo_letivo <- factor(dados_tec$periodo_letivo)
dados_tec$matriculas_iniciais <- as.numeric(dados_tec$matriculas_iniciais)
dados_tec$evasao <- as.numeric(dados_tec$evasao)
dados_tec$retidos <- as.numeric(dados_tec$retidos)
dados_tec$concluintes  <- as.numeric(dados_tec$concluintes)
dados_tec$taxa_evasao  <- as.numeric(dados_tec$taxa_evasao*100)
dados_tec$taxa_retencao  <- as.numeric(dados_tec$taxa_retencao*100)

# Verificando a nova estrutura
ExpData(data = dados_tec, type=2) 
plot_missing(dados_tec) 

# Estrutura dos dados_tec com SmartEDA
sink("sink-tec.txt")
SmartEDA::ExpData(data = dados_tec, type=1)
SmartEDA::ExpData(data = dados_tec, type=2)
sink()

# Salvando arquivos com miss data 
setwd("C:\\Users\\polo\\Desktop\\GitHub\\Graduacao\\data.analysis")
save(dados_tec, file = "dados_tec.RData")
