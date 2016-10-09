app.controller('detalhes', function($stateParams, $scope, $http) {
    $scope.data = [];
    
    $http({
        method: 'GET',
        url: 'http://localhost:5000/bens-por-candidato',
        params: { cpf_cand: $stateParams.cpf_cand }
    })
        .then(function(response) {
            response.data.forEach(function(d) {
            
                var serie = {
                    key: "Valor dos Bens (R$)",
                    color: "#d67222",
                    values: []
                };
                
                d.bens.forEach(function(b) {
                    serie.values.push({
                        label: b.des_tipo,
                        value: b.valor
                    });
                });
                
                $scope.data.push({
                    ano: d.ano,
                    grafico: [serie]
                });
            });
        });
});
