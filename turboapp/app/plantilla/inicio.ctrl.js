'use strict';

angular.module('turboAdmin')
	.controller('inicioCtrl',function($scope){
		console.log('plantilla inicio');
		$scope.userName='David';
		$scope.firstLetter=$scope.userName.substring(0,1);
		
	});