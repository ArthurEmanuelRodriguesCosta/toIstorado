library("RMySQL")
library("dplyr")

mydb <- dbConnect(MySQL(), user='root', 
                 password='pwd', dbname='toistorado', host='localhost')

benssql <- dbSendQuery(mydb, "select * from bens")
bens <- fetch(benssql, n=-1)

dbClearResult(benssql)

consultasql <- dbSendQuery(mydb, "select * from consultas")
consultas <- fetch(consultasql, n=-1)

# tirando suplentes
consultas <- consultas %>% filter(cod_cargo != 9, cod_cargo != 10)


b <- unique(consultas$sqcand, consultas$ano)

#a <- merge(consultas, bens, by="sqcand")

a <- consultas %>% group_by(sqcand, ano) %>% summarise(n=n())
#dado$coluna <- as.character(dado$)



# na mao
#consultas <- consultas[-c(12891, 12949, 13174, 13063, 12627, 12624, 12626, 12625, 12629, 5165, 12630, 12628), ]

#write.csv(consultas, file = "consultasSemRep.csv", row.names = FALSE)




## --- ANALISE Z-SCORE


library(ggplot2)
library("RMySQL")
library("dplyr")

mydb <- dbConnect(MySQL(), user='root', 
                  password='pwd', dbname='toistorado', host='localhost')

benssql <- dbSendQuery(mydb, "select * from bens")
bens <- fetch(benssql, n=-1)

dbClearResult(benssql)

consultasql <- dbSendQuery(mydb, "select * from consultas")
consultas <- fetch(consultasql, n=-1)

# tirando suplentes
consultas <- consultas %>% filter(cod_cargo != 9, cod_cargo != 10)



cand.bens <- merge(bens, consultas, by = "sqcand")

resumo <- cand.bens %>%
  group_by(sqcand, ano.x, cpf_cand, cod_cargo, descricao_cargo) %>%
  summarise(totalBens = sum(valor))



write.csv(resumo, file = "resumo.csv", row.names = FALSE)





