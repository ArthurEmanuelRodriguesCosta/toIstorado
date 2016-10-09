var app = angular.module("app", ['ui.router']); 

app.config(function($stateProvider, $urlRouterProvider) {

	$urlRouterProvider.when('', '/');

	$stateProvider
        .state('home', {
            url: '/',
			controller: 'home',
			templateUrl: '/app/views/home/template.html'	
        })
        
        .state('detalhes', {
            url: '/detalhes/:cpf_cand',
			controller: 'detalhes',
			templateUrl: '/app/views/detalhes/template.html'	
        });	
});
