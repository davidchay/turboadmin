'use strict';
/**
 * @ngdoc function
 * @name sbAdminApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the sbAdminApp
 */
angular.module('turboAdmin')
  .controller('ClientesCtrl', function($scope,$rootScope,$state,$http,Data,toaster) {
    Data.get('clientes/').then(function (results) {
        $scope.clientes=results;
    });

  });


angular.module('turboAdmin').controller('cnuevoCtrl', function($scope,$rootScope,$state,$http,Data,toaster){
	
	//$scope.formData      = {};
    //$scope.formData.date = "";
  	//$scope.opened        = false;
	//Datepicker
	//$scope.dateOptions = {
	//	'year-format': "'yy'",
	//	'show-weeks' : false
	//};


});