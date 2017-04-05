'use strict';

var turboAdmin = angular.module('turboAdmin', [
		'oc.lazyLoad',
		'ui.router',
		'ui.bootstrap',
		'angular-loading-bar',
		'toaster',
		'ngAnimate',
		'ng-sweet-alert'
		]);

turboAdmin.config(['$stateProvider','$urlRouterProvider','$ocLazyLoadProvider',function($stateProvider,$urlRouterProvider,$ocLazyLoadProvider){

	$ocLazyLoadProvider.config({
      debug:false,
      events:true,
    });

	$urlRouterProvider.otherwise('/');

	$stateProvider
		.state('inicio', {
			url:'/',
			templateUrl:'app/plantilla/plantilla.html',
			abstract:true,
			controller:'inicioCtrl',
			resolve:{
				loadDirectives:function($ocLazyLoad){
					return $ocLazyLoad.load(
					{
						name:"turboAdmin",
						files:[
						'app/plantilla/inicio.ctrl.js',
						'app/directives/sidebar/sidebar.js',
						'app/directives/titlepage/titlepage.js'
						]
					});
				}
			}
		})
		.state('inicio.dashboard',{
			url:'',
			templateUrl:'app/dashboard/dashboard.tpl.html',
			controller:'dashboardCtrl',
			resolve:{
				loadDirectives:function($ocLazyLoad){
					return $ocLazyLoad.load(
					{
						name:"turboAdmin",
						files:[
						'app/dashboard/dashboard.ctrl.js',
						'app/directives/titlepage/titlepage.js'
						]
					});
				}
			}
		})
		.state('inicio.clientes',{
			url:'clientes/',
			templateUrl:'app/clientes/clientes.tpl.html',
			controller:'clientesCtrl',
			resolve:{
				loadDirectives:function($ocLazyLoad){
					return $ocLazyLoad.load(
					{
						name:"turboAdmin",
						files:[
						'app/clientes/clientes.ctrl.js',
						'app/directives/titlepage/titlepage.js'
						]
					});
				}
			}
		})
		.state('inicio.cliente',{
			url:'cliente/',
			templateUrl:'app/clientes/cliente.tpl.html',
			controller:'clienteCtrl',
			resolve:{
				loadDirectives:function($ocLazyLoad){
					return $ocLazyLoad.load(
					{
						name:"turboAdmin",
						files:[
						'app/clientes/cliente.ctrl.js',
						'app/directives/titlepage/titlepage.js',
						
						]
					});
				}
			}
		})
		.state('inicio.clienteNuevo',{
			url:'cliente/nuevo',
			templateUrl:'app/clientes/clienteNuevo.tpl.html',
			controller:'clienteNuevoCtrl',
			resolve:{
				loadDirectives:function($ocLazyLoad){
					return $ocLazyLoad.load(
					{
						name:"turboAdmin",
						files:[
						'app/clientes/clienteNuevo.ctrl.js',
						'app/directives/titlepage/titlepage.js',
						'app/factory/data/data.js',
						]
					});
				}
			}
		})

		.state('inicio.antenas',{
			url:'antenas/',
			templateUrl:'app/antenas/antenas.tpl.html',
			abstract:true,
			controller:'antenasCtrl',
			resolve:{
				loadDirectives:function($ocLazyLoad){
					return $ocLazyLoad.load(
					{
						name:"turboAdmin",
						files:[
						'app/antenas/antenas.ctrl.js',
						'app/directives/titlepage/titlepage.js',
						'app/factory/data/data.js',
						]
					});
				}
			}
		})

			.state('inicio.antenas.lista',{
				url:'',
				templateUrl:'app/antenas/antenasLista.tpl.html',
				controller:'antenasListaCtrl',
				resolve:{
					loadDirectives:function($ocLazyLoad){
						return $ocLazyLoad.load(
						{
							name:"turboAdmin",
							files:[
							'app/antenas/antenasLista.ctrl.js',
							'app/factory/data/data.js',
							]
						});
					}
				}
			})

			.state('inicio.antenas.nuevo',{
				url:'antenas/nuevo',
				templateUrl:'app/antenas/antenasNuevo.tpl.html',
				controller:'antenasNuevoCtrl',
				resolve:{
					loadDirectives:function($ocLazyLoad){
						return $ocLazyLoad.load(
						{
							name:"turboAdmin",
							files:[
							'app/antenas/antenasNuevo.ctrl.js',
							'app/factory/data/data.js',
							]
						});
					}
				}
			})
			/*
			.state('inicio.antenas.detalles',{
				url:'antenas/',
				templateUrl:'app/antenas/antenas.tpl.html',
				controller:'antenasCtrl',
				resolve:{
					loadDirectives:function($ocLazyLoad){
						return $ocLazyLoad.load(
						{
							name:"turboAdmin",
							files:[
							'app/antenas/antenas.ctrl.js',
							'app/directives/titlepage/titlepage.js',
							'app/factory/data/data.js',
							]
						});
					}
				}
			})
			*/
		.state('inicio.routers',{
			url:'routers/',
			templateUrl:'app/routers/routers.tpl.html',
			controller:'routersCtrl',
			resolve:{
				loadDirectives:function($ocLazyLoad){
					return $ocLazyLoad.load(
					{
						name:"turboAdmin",
						files:[
						'app/routers/routers.ctrl.js',
						'app/directives/titlepage/titlepage.js',
						'app/factory/data/data.js',
						]
					});
				}
			}
		})

		.state('inicio.ubicacion',{
			url:'ubicacion',
			templateUrl:'app/ubicacion/ubicacion.tpl.html',
			controller:'ubicacionCtrl',
			resolve:{
				loadDirectives:function($ocLazyLoad){
					return $ocLazyLoad.load(
					{
						name:"turboAdmin",
						files:[
							'app/ubicacion/ubicacion.ctrl.js',
							'app/directives/titlepage/titlepage.js',
							'app/factory/data/data.js',
						]
					});
				}
			}
		})

}]);