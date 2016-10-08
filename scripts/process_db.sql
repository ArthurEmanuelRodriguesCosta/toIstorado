USE toIstorado;
CREATE TABLE bens_partido AS SELECT ano, sigla_part, SUM(valor) valor FROM (SELECT sigla_part, sqcand FROM consultas) id INNER JOIN bens ON id.sqcand = bens.sqcand GROUP BY ano, sigla_part;
