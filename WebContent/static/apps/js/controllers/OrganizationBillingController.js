angular.module('MetronicApp').controller('OrganizationBillingController', function($scope, $http, $log, $timeout, store, $rootScope, $state, deviceDetector, auth, DTOptionsBuilder, DTColumnDefBuilder, $q) {
	$scope.$on('$viewContentLoaded', function() {
		
		$log.debug("11233");
		var organizations = [
			{
				student : "Student A",
				invoiceNo : "ABC-0001",
				billedAmnt : "RM 1500",
				billedDate : "24/2/2017"
			},
			{
				student : "Student B",
				invoiceNo : "ABC-0002",
				billedAmnt : "RM 1200",
				billedDate : "24/2/2017"
			},
			{
				student : "Student C",
				invoiceNo : "ABC-0003",
				billedAmnt : "RM 1800",
				billedDate : "24/2/2017"
			}
		]
		getOrgList();
		function getOrgList() {
			$log.debug("HELLO");
			$scope.dtReportOptions = {};
			$scope.dtReportOptions = DTOptionsBuilder.newOptions()
	        .withOption('order', [0, 'asc'])
	        .withOption('bInfo', true)
	        .withOption('bLengthChange', false)
	        .withDisplayLength(10)
	        .withDOM('lfrtip');	
			$scope.dtColumnDefs = [];
			$scope.dtInstance = {};
			$scope.organizations = [];
	
		  function getData(num) {
		    var defer = $q.defer();
			var result = {
		        Data: organizations,
		        Columns: num==1?['Student', 'Inv. No.', 'Billed Amount', 'Billed Date']:['student', 'invoiceNo', 'billedAmnt', 'billedDate']
			};
			defer.resolve(result);
	
		    return defer.promise;
		  }
	
		  $scope.dataNum = 0;
			  $scope.dataNum = ($scope.dataNum == 0) ? 1 : 0;
		    getData($scope.dataNum).then(function(result) {
		      var i = 0;
		      result.Columns.forEach(function(elem) {
		    	  $scope.dtColumnDefs.push(DTColumnDefBuilder.newColumnDef(i++).withTitle(elem));
		      });
		      $scope.organizations = result.Data;
		      $log.debug("Organizations Success ", $scope.organizations);
		      $scope.displayTable = true;
		      $timeout(function(){
		    	  $('[data-toggle="tooltip"]').tooltip(); 
		      }, 300);
		    });
		}
//		
//		$scope.openModal = function(value, obj, index){
//			if (value == 'createOrganizationModal')
//			{
//				$('#'+value).modal('show');	
//			}
//		}
//		
//		$scope.viewOrgInfo = function(org){
//			$log.debug("Navigation Working", org);
//			$state.go('organizationInformation', {obj : org});
//		}
	});
});