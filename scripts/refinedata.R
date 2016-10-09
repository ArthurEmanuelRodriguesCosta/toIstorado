
library(dplyr)


colnames(bem.2012) <- c("data", "hora", "ano", "eleicao", 
                        "uf", "sqcand", "cod_tipo", "des_tipo",
                        "detalhe", "valor", "data_atualizacao", "hora_atualizacao")


colnames(consulta.2012) <- c("data", "hora", "ano", "n_turno",
                             "eleicao", "uf", "cod_mun", "descricao_mun",
                             "cod_cargo", "descricao_cargo", "nome_cand", "sqcand", 
                             "num_cand", "cpf_cand", "nome_urna", "cod_situa_cand", 
                             "descr_situacao", "num_partido", "sigla_part", "partido",
                             "cod_legenda", "sigla_legenda", "comp_legenda", "nome_legenda", 
                             "cod_ocupacao", "desc_ocu", "nascimento", "numero_titulo", "idade_eleicao", 
                             "cod_sexo", "sexo", "cod_instrucao", "instrucao", "cod_estacivil", "esta_civil",
                             "cod_nacionalidade", "nacionalidade", "uf_nacimento", "cod_municipio_nasc", 
                             "nome_municipio_nasc", "despesa_max_camp", "cod_sit_tot_turno", "sit_tot_turno", "email")


colnames(bem.2014) <- c("data", "hora", "ano", "eleicao", 
                        "uf", "sqcand", "cod_tipo", "des_tipo",
                        "detalhe", "valor", "data_atualizacao", "hora_atualizacao")

consulta.2014$V7 <- NULL
consulta.2014$V8 <- NULL

colnames(consulta.2014) <- c("data", 
                             "hora", 
                             "ano", "n_turno",
                             "eleicao", "uf",
                             "cod_cargo", "descricao_cargo", "nome_cand", "sqcand", 
                             "num_cand", "cpf_cand", "nome_urna", 
                             "cod_situa_cand", 
                             "descr_situacao", 
                             "num_partido", "sigla_part", "partido",
                             "cod_legenda", "sigla_legenda", "comp_legenda", "nome_legenda", 
                             "cod_ocupacao", "desc_ocu", "nascimento", "numero_titulo", "idade_eleicao", 
                             "cod_sexo", "sexo", "cod_instrucao", "instrucao", "cod_estacivil", "esta_civil",
                             "cod_etnia", "etnia", "cod_nacionalidade", "nacionalidade", 
                             "uf_nacimento", "cod_municipio_nasc", 
                             "nome_municipio_nasc", 
                             "despesa_max_camp", "cod_sit_tot_turno", 
                             "sit_tot_turno", "email")


colnames(bem.2016) <- c("data", "hora", "ano", "eleicao", 
                        "uf", "sqcand", "cod_tipo", "des_tipo",
                        "detalhe", "valor", "data_atualizacao", "hora_atualizacao")


colnames(consulta.2016) <- c("data", "hora", "ano", "n_turno",
                             "eleicao", "uf", "cod_mun", "descricao_mun",
                             "cod_cargo", "descricao_cargo", "nome_cand", "sqcand", 
                             "num_cand", "cpf_cand", "nome_urna", "cod_situa_cand", 
                             "descr_situacao", "num_partido", "sigla_part", "partido",
                             "cod_legenda", "sigla_legenda", "comp_legenda", "nome_legenda", 
                             "cod_ocupacao", "desc_ocu", "nascimento", "numero_titulo", "idade_eleicao", 
                             "cod_sexo", "sexo", "cod_instrucao", "instrucao", "cod_estacivil", "esta_civil",
                             "cod_etnia", "etnia",
                             "cod_nacionalidade", "nacionalidade", "uf_nacimento", "cod_municipio_nasc", 
                             "nome_municipio_nasc", "despesa_max_camp", "cod_sit_tot_turno", 
                             "sit_tot_turno", "email")


colnames(bem.2010) <- c("data", "hora", "ano", "eleicao", 
                        "uf", "sqcand", "cod_tipo", "des_tipo",
                        "detalhe", "valor", "data_atualizacao", "hora_atualizacao")



colnames(consulta.2010) <- c("data", "hora", "ano", "n_turno",
                             "eleicao", "uf",
                             "cod_cargo", "descricao_cargo", "nome_cand", "sqcand", 
                             "num_cand", "cpf_cand", "nome_urna", "cod_situa_cand", 
                             "descr_situacao", "num_partido", "sigla_part", "partido",
                             "cod_legenda", "sigla_legenda", "comp_legenda", "nome_legenda", 
                             "cod_ocupacao", "desc_ocu", "nascimento", "numero_titulo", "idade_eleicao", 
                             "cod_sexo", "sexo", "cod_instrucao", "instrucao", "cod_estacivil", "esta_civil",
                             "cod_nacionalidade", "nacionalidade", "uf_nacimento", "cod_municipio_nasc", 
                             "nome_municipio_nasc", "despesa_max_camp", "cod_sit_tot_turno", "sit_tot_turno")

consulta.2010$V7 <- NULL
consulta.2010$cod_cargo <- NULL




### --- BENS
bem.2012.filtered <- bem.2012 %>%
  select(ano, uf, sqcand, cod_tipo, des_tipo, detalhe, valor,
         data_atualizacao, data)

bem.2014.filtered <- bem.2014 %>%
  select(ano, uf, sqcand, cod_tipo, des_tipo, detalhe, valor,
         data_atualizacao, data)

bem.2016.filtered <- bem.2016 %>%
  select(ano, uf, sqcand, cod_tipo, des_tipo, detalhe, valor,
         data_atualizacao, data)

bem.2010.filtered <- bem.2010 %>%
  select(ano, uf, sqcand, cod_tipo, des_tipo, detalhe, valor,
         data_atualizacao, data)



write.csv(bem.2012.filtered, file = "../datahack/bem2012filtered.csv", row.names = FALSE)
write.csv(bem.2014.filtered, file = "../datahack/bem2014filtered.csv", row.names = FALSE)
write.csv(bem.2016.filtered, file = "../datahack/bem2016filtered.csv", row.names = FALSE)
write.csv(bem.2010.filtered, file = "../datahack/bem2010filtered.csv", row.names = FALSE)

### --- CONSULTAS


consulta.2012.filtered <- consulta.2012 %>%
  select(ano, uf, cod_cargo, descricao_cargo, nome_urna, sqcand,
         cpf_cand, num_cand, descr_situacao, num_partido, sigla_part, partido,
         nascimento, desc_ocu, despesa_max_camp, email)

consulta.2014.filtered <- consulta.2014 %>%
  select(ano, uf, cod_cargo, descricao_cargo, nome_urna, sqcand,
         cpf_cand, num_cand, descr_situacao, num_partido, sigla_part, partido,
         nascimento, desc_ocu, despesa_max_camp, email)

consulta.2016.filtered <- consulta.2016 %>%
  select(ano, uf, cod_cargo, descricao_cargo, nome_urna, sqcand,
         cpf_cand, num_cand, descr_situacao, num_partido, sigla_part, partido,
         nascimento, desc_ocu, despesa_max_camp, email)

consulta.2010.filtered <- consulta.2010 %>%
  select(ano, uf, cod_cargo, descricao_cargo, nome_urna, sqcand,
         cpf_cand, num_cand, descr_situacao, num_partido, sigla_part, partido,
         nascimento, desc_ocu, despesa_max_camp)


consulta.2010.filtered$email <- "Não disponível"

write.csv(consulta.2012.filtered, file = "../datahack/consulta2012filtered.csv", row.names = FALSE)
write.csv(consulta.2014.filtered, file = "../datahack/consulta2014filtered.csv", row.names = FALSE)
write.csv(consulta.2016.filtered, file = "../datahack/consulta2016filtered.csv", row.names = FALSE)
write.csv(consulta.2010.filtered, file = "../datahack/consulta2010filtered.csv", row.names = FALSE)


### --- BINDING DATA

bens <- rbind(bem.2012.filtered, bem.2014.filtered, bem.2016.filtered, bem.2010.filtered)
consultas <- rbind(consulta.2012.filtered, consulta.2014.filtered, consulta.2016.filtered, consulta.2010.filtered)


bens$sqcand <-as.factor(bens$sqcand)

consultas$sqcand <-as.factor(consultas$sqcand)
consultas$cpf_cand <-as.factor(consultas$cpf_cand)


write.csv(bens, file = "../datahack/bens.csv", row.names = FALSE)
write.csv(consultas, file = "../datahack/consultas.csv", row.names = FALSE)









