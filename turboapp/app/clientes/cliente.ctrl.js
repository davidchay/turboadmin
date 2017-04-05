'use strict';

angular.module('turboAdmin')
	.controller('clienteCtrl',function($scope, $rootScope){
		$scope.titlePage="Cliente";



  	$scope.fechaNac = new Date();
  
  	$scope.open = function($event) {
    	$event.preventDefault();
    	$event.stopPropagation();

    	$scope.opened = true;
  	};

  	
  	$scope.dateOptions = {
	    formatYear: 'yy',
	    showWeeks:false,
	    startingDay: 1,
	   };
 

  

		
});