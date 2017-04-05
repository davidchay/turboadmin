'use strict';

angular.module('turboAdmin')
	.controller('clienteNuevoCtrl',function($scope,$rootScope,$http,$state,Data,toaster){
		$scope.titlePage="Cliente Nuevo";
		///Modelo del cliente nuevo
		
		$scope.cliente = {
			nombre:'',
			direccion:'',
			referencias:'',
			colonia:'',
			telefono:'',
			celular:'',
			email:'',
			categoria:'',
			id_ubicacion:0,
			fecha_alta:'',
			estado:'',
			observaciones:''
		};
	
		//Categorias
		$scope.categorias=[
			{nombre:'Recidencial'},
			{nombre:'Negocio'}
		];
		$scope.chgCat=function(name){
			$scope.cliente.categoria=name;
			console.log($scope.cliente.categoria);
		};
		//Ubicacion
		Data.get('ubicacion/').then(function (results) {
        	$scope.ubicaciones=results;
    	});

		$scope.changeUbi = function(id){
			$scope.cliente.id_ubicacion=id;
		};	
		//Fecha de alta
		$scope.fecha_alta = new Date();
  
	  	$scope.open = function($event) {
	    	$event.preventDefault();
	    	$event.stopPropagation();
	    	$scope.opened = true;
	  	};

  	
	  	$scope.dateOptions = {
		    showWeeks:false,
		    startingDay: 1,
		};

		

		//RESET FORM
		$scope.resetForm=function(){
			$scope.cliente = {
				nombre:'',
				direccion:'',
				referencias:'',
				colonia:'',
				telefono:'',
				celular:'',
				email:'',
				categoria:'',
				id_ubicacion:0,
				fecha_alta:'',
				estado:'',
				observaciones:''
			};
			$scope.categoria='';
			$scope.ubicacion='';
			$scope.fecha_alta = new Date();
		};
		///GUARDAR DATOS
		$scope.guardar=function(){
			$scope.cliente.fecha_alta=$scope.fecha_alta.toISOString().substring(0, 19).replace('T', ' ');
			Data.post('cliente/nuevo',$scope.cliente).then(function (results) {
	        	if(results.status){
	              $scope.cliente='';
	              toaster.pop('success', "Cliente registrado", results.message);
	              Data.get('ubicacion/').then(function (results) {
	                  $scope.ubicaciones=results;
	              });              
	          	}else{
	            	toaster.pop('error', "Error", "El registro no se puedo agregar a la base de datos");
	          	}
	        });
		}
	});