'use strict';


angular.module('turboAdmin')
	.directive('sidebar',['$location',function(){
		return {
        	templateUrl:'app/directives/sidebar/sidebar.html',
        	restrict: 'E',
        	replace: true,
        	scope: {
		    },
		    controller:function($scope,$rootScope){
		        $scope.selectedMenu = 'dashboard';
		        $scope.collapseVar = 0;
		        $scope.multiCollapseVar = 0;

		        $scope.check = function(x){
		        	//x.preventDefault();
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

		        $('#sidebar-hide').click(function(e) {
			        console.log('menu sidebar');
			        $(".sidebar").fadeOut('slow');
			        e.preventDefault();
			    });
		    }
		}
	}]);
