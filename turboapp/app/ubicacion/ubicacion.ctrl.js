'use strict';

angular.module('turboAdmin')
	.controller('ubicacionCtrl',function($scope, $rootScope,$http,$state,$modal,Data,toaster){
		$scope.n='';
    $scope.ubicaciones='';
    Data.get('ubicacion/').then(function (results) {
        $scope.ubicaciones=results;
    });

    $scope.titlePage="Ubicación";
    
   
    $scope.addUbicacion=function(n){
        Data.post('ubicacion/nuevo',$scope.n).then(function (results) {
          if(results.status){
              $scope.ubicaciones.push(n);
              $scope.n='';
              toaster.pop('success', "Nueva ubicación", "El registro se agrego correctamente");
              Data.get('ubicacion/').then(function (results) {
                  $scope.ubicaciones=results;
              });              
          }else{
            toaster.pop('error', "Error", "El registro no se puedo agregar a la base de datos");
          }
        });
    }



    //Open editar modal

    $scope.editar = function (ubicacion,i) {
      var modalInstance = $modal.open({
        templateUrl: 'editUbicacion.html',
        controller: 'editUbicacionCtrl',
        resolve: {
          ubicacion:function(){
            return ubicacion;
          }
        }
      });

      modalInstance.result.then(function (ubi) {
        $scope.ubicaciones[i]=ubi;
      }, function () {
       // $log.info('Modal dismissed at: ' + new Date());
      });
    };

    $scope.deleteUbicacion = {};
    $scope.deleteUbicacion.option = {
            title: "¿Estas seguro?",
            text: "El registro se eliminará de la base de datos",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "¡Si, Eliminar!",
            cancelButtonText: "¡No, cancelar!",
            closeOnConfirm: false,
            closeOnCancel: false
        }
        $scope.deleteUbicacion.confirm = {
            title: '¡Eliminado!',
            text: 'El registro fue eliminado exitosamente.',
            type: 'success'
        };

        $scope.deleteUbicacion.cancel = {
            title: '¡Cancelado!',
            text: 'El registro NO se ha eliminado',
            type: 'error'
        }
        
        $scope.cancelUbi=function(){
        
        }
        
         $scope.delUbiConfirm=function(i){
            var id=$scope.ubicaciones[i].id_ubicacion;
            Data.delete('ubicacion/'+id).then(function (results) {
              if(results.status){
                $scope.ubicaciones.splice(i, 1);
                toaster.pop('success', "Eliminado", results.message);
              }else{
                toaster.pop('error', "¡Error!", results.message);
              }
            });
        }
});



angular.module('turboAdmin').controller('editUbicacionCtrl', function ($scope,$rootScope, $modalInstance,ubicacion,$http, $state,toaster,Data) {

  $scope.u=ubicacion;
  $scope.ok = function () {
    Data.put('ubicacion/'+ubicacion.id_ubicacion,$scope.u).then(function (results) {
      if(results.status){
          toaster.pop('success', "Cambios guardados", results.message);
      }else{
          toaster.pop('error', "Error!", results.message);
      }
    });
    $modalInstance.close($scope.u);
  };

  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
    toaster.pop('info', "Operación cancelada", "Los cambios no se guardarón");
  };
});