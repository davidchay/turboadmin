'use strict';
/**
 * @ngdoc function
 * @name sbAdminApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the sbAdminApp
 */
angular.module('turboAdmin')
  .controller('MainCtrl', function($scope,$position) {
    $scope.usuario = {
     nombre: 'Jhon',
     direccion: 'Av. Jose pardo 481',
     perfil:'admin',
    };
  });
