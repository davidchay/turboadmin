'use strict';


angular.module('turboAdmin')
	.directive('titlePage',function(){
		return {
        	templateUrl:'app/directives/titlepage/titlepage.html',
        	restrict: 'E',
        	replace: true,
        	controller:function($scope){
        		$('#menuSidebar-toggle').click(function(e) {
			        $(".sidebar").css("overflow","visible");
			        $(".sidebar").fadeIn('slow');
			        e.preventDefault();
			    });
        	}
		}
	});
