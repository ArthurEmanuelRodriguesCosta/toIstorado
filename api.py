import json, re

from flask import Flask, request
from sqlalchemy import create_engine

app = Flask(__name__)
engine = create_engine('mysql://root:pwd@localhost/toIstorado')

@app.route('/candidatos')
def candidatos():
    with engine.connect() as con:
        r = con.execute('SELECT nome_urna, cpf_cand FROM consultas')

        return json.dumps([{
            'nome_urna': nome_urna.decode('latin-1'),
            'cpf_cand': cpf_cand
        } for nome_urna, cpf_cand in r])

@app.route('/bens-por-candidato')
def bens_por_candidato():
    cpf_cand = request.args.get('cpf_cand')
    assert re.match('\d{11}', cpf_cand)

    with engine.connect() as con:
        r = con.execute('SELECT ano, des_tipo, SUM(valor) FROM (SELECT sqcand FROM consultas WHERE cpf_cand = ' + cpf_cand + ') id INNER JOIN bens on id.sqcand = bens.sqcand GROUP BY ano, des_tipo')

        aux = {}
        for ano, des_tipo, valor in r:
            if ano not in aux:
                aux[ano] = []

            aux[ano].append({
                'des_tipo': des_tipo.decode('latin-1'),
                'valor': int(valor)
            })

        return json.dumps([{
            'ano': ano,
            'bens': bens
        } for ano, bens in aux.iteritems()])

@app.route('/bens-por-partido')
def bens_por_partido():
    with engine.connect() as con:
        r = con.execute('SELECT ano, sigla_part, valor FROM bens_partido')

        aux = {}
        for ano, sigla_part, valor in r:
            if ano not in aux:
                aux[ano] = []

            aux[ano].append({
                'sigla_part': sigla_part,
                'valor': int(valor)
            })

        return json.dumps([{
            'ano': ano,
            'partidos': partidos
        } for ano, partidos in aux.iteritems()])

if __name__ == '__main__':
    app.run()