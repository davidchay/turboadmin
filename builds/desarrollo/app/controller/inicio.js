/***
* Controlador de la plantilla inicio
*/
angular.module('turboAdmin')
.controller("inicio",function($scope,$http)
{
  var menu=[
    { opcion:'dashboard',state:'inicio.dashboard' },
    { opcion:'Clientes',state:'inicio.clientes' },
    { opcion:'Servicios',state:'inicio.servicios' },

  ];
    // 'dashboard':'/',
    // 'clientes':'/clientes/',
    // 'servicios':'/servicios/',

  $scope.usuario = {
    ID:'12345',
    userName:'Davi',
    nombre:'David Chay',
    IDPerfil:'1',
    perfil:'Administrador',
    menu:menu

  };

  console.log($scope.usuario);
});
