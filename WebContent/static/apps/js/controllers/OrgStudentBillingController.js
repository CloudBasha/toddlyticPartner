angular.module('MetronicApp').controller('OrgStudentBillingController', function($rootScope, $scope, $http, $timeout, $log, $state, $stateParams, store, DTOptionsBuilder, DTColumnDefBuilder, $q) {
	$scope.$on('$viewContentLoaded', function() {

		$('.toddlyticDatepicker').datepicker({format : 'MM yyyy', autoclose : true, endDate : moment().format()});
		
		if($stateParams.obj == null){
			$scope.orgStudentBillingObj = store.get('orgStudentBillingObj');
			$scope.orgProgramBillingObj = store.get('orgProgramBillingObj');
			$rootScope.orgCurrency = store.get('orgCurrency');
		}
		else{
			store.set('orgStudentBillingObj', $stateParams.obj);
			$scope.orgStudentBillingObj = store.get('orgStudentBillingObj');
			$scope.orgProgramBillingObj = store.get('orgProgramBillingObj');
		}

		$scope.orgInfo = store.get('organizationInformation');
		if (!$scope.orgProgramBillingObj) {
			$state.go('login');
		}
		$scope.orgName = $scope.orgProgramBillingObj.name;
		$scope.programName = $scope.orgStudentBillingObj.name;
		$scope.orgStudentBillingDate = $scope.orgStudentBillingObj.searchDate;
		$log.debug("Params ", $scope.orgStudentBillingObj);		
		$log.debug("Params 2", $scope.orgProgramBillingObj);	
		
		$timeout(function(){
	        $('.toddlyticDatepicker').datepicker('setDate', $scope.orgStudentBillingDate);
		}, 300);
		
		$scope.getOrgStudentBilling = function() {

			  var splitDate = $scope.orgStudentBillingDate.split(' ');
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
			  $scope.dtOrgStudentBillingOptions = {};
			  $scope.dtOrgStudentBillingOptions = DTOptionsBuilder.newOptions()
		        .withOption('order', [0, 'asc'])
		        .withOption('bInfo', true)
		        .withOption('bLengthChange', false)
		        .withDisplayLength(10)
		        .withDOM('lfrtip');	
			  $scope.dtOrgStudentBillingColumnDefs = [];
			  $scope.dtInstance = {};
			  $scope.orgStudentBillingInfo = [];

			  function getData(num) {
			    var defer = $q.defer();
			    var getOrgStudentBillingReq = {
		    		programSchoolId  : $scope.orgStudentBillingObj.id.toString(),
					date : parsedDate
				}
				$log.debug("Billing Request ", getOrgStudentBillingReq);
				$http.post($rootScope.baseUrl+'/cms/getStudentBillingInfo', getOrgStudentBillingReq)
				.success(function(response) {
					var result = {
				        Data: response.list,
				        Columns: num==1?['Student', 'Invoice Name', 'Invoice Total('+$rootScope.orgCurrency+')', 'Payment Status', 'Actions']:['student', 'invoiceName', 'invoiceTotal', 'paymentStatus', 'actions']
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
				  $scope.displayOrgStudentBillingTable = false;
			    getData($scope.dataNum).then(function(result) {
			      var i = 0;
			      result.Columns.forEach(function(elem) {
			    	  $scope.dtOrgStudentBillingColumnDefs.push(DTColumnDefBuilder.newColumnDef(i++).withTitle(elem));
			      });
			      $scope.orgStudentBillingInfo = result.Data;
			      $log.debug("Org Billing Success ", $scope.orgStudentBillingInfo);
			      $scope.displayOrgStudentBillingTable = true;

			        $timeout(function(){
						$('[data-toggle="tooltip"]').tooltip(); 
					}, 300);
//			      adjustContainerHeight();
			    });
		};
		

		$scope.getOrgStudentBilling();
		
		function adjustContainerHeight(){
			$timeout(function(){
				$scope.containerHeight = $('#myTabContent').height() + 50;
				$log.debug("Container Height ", $scope.containerHeight);
			}, 300);
		}
	});
});