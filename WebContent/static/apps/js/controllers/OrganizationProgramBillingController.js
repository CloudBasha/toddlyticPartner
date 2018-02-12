angular.module('MetronicApp').controller('OrganizationProgramBillingController', function($scope, $http, $log, $stateParams, $timeout, store, $rootScope, $state, deviceDetector, auth, DTOptionsBuilder, DTColumnDefBuilder, $q) {
	$scope.$on('$viewContentLoaded', function() {

		$('.toddlyticDatepicker').datepicker({format : 'MM yyyy', autoclose : true, endDate : moment().format()});
		
		if($stateParams.obj == null){
			$scope.orgProgramBillingObj = store.get('orgProgramBillingObj');
			$rootScope.orgCurrency = store.get('orgCurrency');
		}
		else{
			store.set('orgProgramBillingObj', $stateParams.obj);
			$scope.orgProgramBillingObj = store.get('orgProgramBillingObj');
		}
		$scope.orgInfo = store.get('organizationInformation');
		if(!$scope.orgProgramBillingObj) {
			$state.go('login');
		}
		$scope.orgName = $scope.orgProgramBillingObj.name;
		$scope.orgProgramBillingDate = $scope.orgProgramBillingObj.searchDate;
		$log.debug("Params ", $scope.orgProgramBillingObj);		
		
		$timeout(function(){
	        $('.toddlyticDatepicker').datepicker('setDate', $scope.orgProgramBillingDate);
		}, 300);
		
		$scope.getOrgProgramBilling = function() {
			  
			  var splitDate = $scope.orgProgramBillingDate.split(' ');
			  $log.debug("Split Date ", splitDate);
			  if(splitDate[0] == 'January'){
				  var parsedDate = '01-01-'+splitDate[1];
			  }
			  else if(splitDate[0] == 'February'){
				  var parsedDate = '01-02-'+splitDate[1];
			  }
			  else if(splitDate[0] == 'March'){
				  var parsedDate = '01-03-'+splitDate[1];
			  }
			  else if(splitDate[0] == 'April'){
				  var parsedDate = '01-04-'+splitDate[1];
			  }
			  else if(splitDate[0] == 'May'){
				  var parsedDate = '01-05-'+splitDate[1];
			  }
			  else if(splitDate[0] == 'June'){
				  var parsedDate = '01-06-'+splitDate[1];
			  }
			  else if(splitDate[0] == 'July'){
				  var parsedDate = '01-07-'+splitDate[1];
			  }
			  else if(splitDate[0] == 'August'){
				  var parsedDate = '01-08-'+splitDate[1];
			  }
			  else if(splitDate[0] == 'September'){
				  var parsedDate = '01-09-'+splitDate[1];
			  }
			  else if(splitDate[0] == 'October'){
				  var parsedDate = '01-10-'+splitDate[1];
			  }
			  else if(splitDate[0] == 'November'){
				  var parsedDate = '01-11-'+splitDate[1];
			  }
			  else if(splitDate[0] == 'December'){
				  var parsedDate = '01-12-'+splitDate[1];
			  }
			  $scope.dtOrgProgramBillingOptions = {};
			  $scope.dtOrgProgramBillingOptions = DTOptionsBuilder.newOptions()
		        .withOption('order', [0, 'asc'])
		        .withOption('bInfo', true)
		        .withOption('bLengthChange', false)
		        .withDisplayLength(10)
		        .withDOM('lfrtip');	
			  $scope.dtOrgProgramBillingColumnDefs = [];
			  $scope.dtInstance = {};
			  $scope.orgProgramBillingInfo = [];

			  function getData(num) {
			    var defer = $q.defer();
			    var getOrgProgramBillingReq = {
					schoolId  : $scope.orgProgramBillingObj.id.toString(),
					date : parsedDate
				}
				$log.debug("Billing Request ", getOrgProgramBillingReq);
				$http.post($rootScope.baseUrl+'/cms/getSchoolBillingInfo', getOrgProgramBillingReq)
				.success(function(response) {
					var result = {
				        Data: response.list,
				        Columns: num==1?['Program', 'Expect Income('+$rootScope.orgCurrency+')', 'Collected Income('+$rootScope.orgCurrency+')', 'Shortfall (%)']:['program', 'expectIncome', 'collectedIncome', 'shortfall']
					};
					defer.resolve(result);
			    }, function(err) {
			        // fail case
			        $log.debug("Error ", err);
			    });

			    return defer.promise;
			  }

			  $scope.dataNum = 0;
				  $scope.dataNum = ($scope.dataNum == 0) ? 1 : 0;
				  $scope.displayOrgProgramBillingTable = false;
			    getData($scope.dataNum).then(function(result) {
			      var i = 0;
			      result.Columns.forEach(function(elem) {
			    	  $scope.dtOrgProgramBillingColumnDefs.push(DTColumnDefBuilder.newColumnDef(i++).withTitle(elem));
			      });
			      $scope.orgProgramBillingInfo = result.Data;
			      $log.debug("Org Billing Success ", $scope.orgProgramBillingInfo);
			      $scope.displayOrgProgramBillingTable = true;
			      adjustContainerHeight();
			    });
		};
		
		$scope.goToOrgStudentBilling = function(billing){
			billing.searchDate = $scope.orgProgramBillingDate;
			$state.go('orgStudentBilling', {obj : billing});
		}

		$scope.getOrgProgramBilling();
		
		function adjustContainerHeight(){
			$timeout(function(){
				$scope.containerHeight = $('#myTabContent').height() + 50;
				$log.debug("Container Height ", $scope.containerHeight);
			}, 300);
		}
	});
});
	
	