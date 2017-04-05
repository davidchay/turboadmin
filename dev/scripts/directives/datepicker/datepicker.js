// Code goes here
angular.module('turboAdmin')

//Datepicker
.directive("calendario", function(){
  console.log('calendario');
  return {
    restrict: "E",
    scope:{
      ngModel: "=",
      dateOptions: "=",
      opened: "=",
    },
    link: function($scope, element, attrs) {
      $scope.open = function(event){
        event.preventDefault();
        event.stopPropagation();
        $scope.opened = true;
      };

      $scope.clear = function () {
        $scope.ngModel = null;
      };
    },
    templateUrl: 'scripts/directives/datepicker/datepicker.html'
  }
})