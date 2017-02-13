/***
* Controlador de la plantilla inicio
*/
angular.module('turboAdmin')
.controller("inicio",function($scope,$http)
{
  var menu=[
    { opcion:'Dashboard',state:'inicio.dashboard' },
    { opcion:'Clientes',state:'inicio.clientes' },
    { opcion:'Servicios',state:'inicio.servicios' },
  ];
  var subMenu=[
    {Dashboard:''},
    {Clientes:[
      {opcion:'Clientes', state:'inicio.clientes.list'},
      {opcion:'Nuevo Cliente', state:'inicio.clientes.nuevo'}
      ]
    },
    {Servicios:[
      {opcion:'Servicios', state:'inicio.servicios.list'},
      {opcion:'Agregar servicio', state:'inicio.servicios.nuevo'}
    ]}
  ];


  $scope.usuario = {
    ID:'12345',
    userName:'Davi',
    nombre:'David Chay',
    IDPerfil:0,
    perfil:'Administrador',
    menu:menu

  };

  console.log($scope.usuario);
});
