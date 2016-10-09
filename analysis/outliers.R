library(gridExtra)
library(reshape2)
library(ggplot2)
library(dplyr)

# ------------- FUNCTIONS -----------

soma_bens <- function(ano_cand, codigo_cand, dados_consulta) {
  s = sum(with(dados_consulta, valor*(ano == ano_cand && codigo_cand == sqcand)))
  return(s)
}

quant_bens <- function(ano_cand, codigo_cand, dados_consulta) {
  s = nrow(bens[bens$ano == ano_cand,][codigo_cand == bens$sqcand,])
  return(s)
}

#------------- GET DATA ------------

setwd("~/toIstorado/") ## mudar path se necessário

arquivo_bens = "datahack/bens.csv"
bens <- read.csv(arquivo_bens, 
                  header = T,  
                  sep = ",")


arquivo_consultas = "datahack/consultas.csv"
consultas <- read.csv(arquivo_consultas, 
                   header = T,  
                   sep = ",")

# ----------- PREPARING DATA ----------------------

consultas <- group_by(consultas, descricao_cargo)

# melhor para comparar sendo strings
consultas$sqcand <- as.character(consultas$sqcand)
bens$sqcand <- as.character(bens$sqcand)

# ano_sqcand eh usado como id
bens$ano_sqcand <- with(bens, paste0(ano, sqcand))
consultas$ano_sqcand <- with(consultas, paste0(ano, sqcand))

# sao somados todos os bens de um certo id
soma_valores <- aggregate(bens$valor, list(v = bens$ano_sqcand), sum)
test <- soma_valores[soma_valores$v == "2012150000012353", ]
consultas['valor_bens'] = 0
consultas['quant_bens'] = 0

for (i in seq(1, nrow(consultas), by=1)) {
  consultas$valor_bens[i] <- soma_valores[soma_valores$v == consultas$ano_sqcand[i], ]$x[1]
}

ggplot(data=test, aes(x=as.factor(nodes), y=time, colour=as.factor(reduces))) +
  geom_boxplot() +
  facet_wrap(~name) 
