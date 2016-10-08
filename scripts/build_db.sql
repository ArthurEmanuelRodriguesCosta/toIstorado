USE toIstorado;
DROP TABLE IF EXISTS bens, consultas, bens_partido;

CREATE TABLE bens (ano INT, uf VARCHAR(5), sqcand BIGINT, cod_tipo INT, des_tipo VARCHAR(255), detalhe VARCHAR(255), valor INT, data_atualizacao VARCHAR(20), data VARCHAR(20));
CREATE TABLE consultas (ano INT, uf VARCHAR(5), cod_cargo INT, descricao_cargo VARCHAR(20), nome_urna VARCHAR(255), sqcand BIGINT, cpf_cand VARCHAR(11), num_cand INT, descr_situacao VARCHAR(255), num_partido INT, sigla_part VARCHAR(10), partido VARCHAR(255), nascimento VARCHAR(20), desc_ocu VARCHAR(255), despesa_max_camp INT, email VARCHAR(255));
