var turboAdmin = angular.module('turboAdmin', ['ui.router']);


turboAdmin.config(function($stateProvider, $urlRouterProvider) {
//funcion para
function view(template){
  return './app/views/'+template+'.html';
}

  $urlRouterProvider.otherwise('/');

  $stateProvider
        .state('inicio',{
          url:'/',
          abstract: true,
          templateUrl:view('inicio'),
          controller:'inicio'
        })
        .state('inicio.dashboard',{
          url: '',
          templateUrl:view('dashboard')
        })
        .state('inicio.clientes',{
          url:'clientes/',
          templateUrl:view('clientes')
        });


});
