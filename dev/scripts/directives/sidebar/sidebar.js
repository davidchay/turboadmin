'use strict';

/**
 * @ngdoc directive
 * @name izzyposWebApp.directive:adminPosHeader
 * @description
 * # adminPosHeader
 */

angular.module('turboAdmin')
  .directive('sidebar',['$location',function() {
    //var plantilla='scripts/directives/sidebar/sidebar.html';

    return {
      restrict: 'E',
      replace: true,
      link: function(scope,elem,attrs){
          scope.getContentUrl = function() {
                return 'scripts/directives/sidebar/sidebar-' + attrs.menu + '.html';
           };
      },
      template:'<div ng-include="getContentUrl()"></div>',
      scope: {


      },
      controller:function($scope){
        $scope.selectedMenu = 'dashboard';
        $scope.collapseVar = 0;
        $scope.multiCollapseVar = 0;

        $scope.check = function(x){

          if(x==$scope.collapseVar)
            $scope.collapseVar = 0;
          else
            $scope.collapseVar = x;
        };

        $scope.multiCheck = function(y){

          if(y==$scope.multiCollapseVar)
            $scope.multiCollapseVar = 0;
          else
            $scope.multiCollapseVar = y;
        };
      }
    }
  }]);
