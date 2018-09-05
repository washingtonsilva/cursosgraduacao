# Diretorio de trabalho
setwd("C:\\Users\\polo\\Desktop\\GitHub\\Graduacao\\data.raw")

# Pacotes que serao utilizados
library(readxl)
library(DataExplorer)
library(SmartEDA)
library(dplyr)

# Importando os dados
dados_grad <- read_xlsx("graduacao_consolidado.xlsx")
names(dados_grad)
str(dados_grad)

# Visao geral dos dados via SmartEDA
ExpData(data = dados_grad, type=1) # Type = 1 - Visao Geral
ExpData(data = dados_grad, type=2) # Type = 2 - Estrutura dos dados

# Convertendo os nomes das variaveis para letras minusculas
# names(dados) <- casefold(names(dados))


# Definindo o tipo de cada variavel

dados_grad$curso  <- factor(dados_grad$curso)
dados_grad$periodo_letivo <- factor(dados_grad$periodo_letivo)
dados_grad$matriculas_iniciais <- factor(dados_grad$matriculas_iniciais)
dados_grad$evasao <- as.numeric(dados_grad$evasao)
dados_grad$trancamento <- as.numeric(dados_grad$trancamento)
dados_grad$retidos <- as.numeric(dados_grad$retidos)
dados_grad$concluintes  <- as.numeric(dados_grad$concluintes)
dados_grad$taxa_evasao  <- as.numeric(dados_grad$taxa_evasao*100)

# Verificando a nova estrutura
ExpData(data = dados_grad, type=2) 
plot_missing(dados_grad) 

# Estrutura dos dados_grad com SmartEDA
sink("sink-ExpData.txt")
SmartEDA::ExpData(data = dados_grad, type=1)
SmartEDA::ExpData(data = dados_grad, type=2)
sink()

# Salvando arquivos com miss data 
setwd("C:\\Users\\polo\\Desktop\\GitHub\\Graduacao\\data.analysis")
save(dados_grad, file = "dados_grad_misscomp.RData")
