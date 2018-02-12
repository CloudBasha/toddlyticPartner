angular.module('MetronicApp').controller('OrganizationsController', function($scope, $http, $log, $timeout, store, $rootScope, $state, $stateParams, deviceDetector, auth, DTOptionsBuilder, DTColumnDefBuilder, $q) {
	$scope.$on('$viewContentLoaded', function() {
		
		$scope.displayTable = false;

		var prefix = '/cms';
		if ($state.current.name.includes('enterprise_')) {
			prefix = '/enterprise';
		}
		$scope.dtReportOptions = {};
		$scope.dtReportOptions = DTOptionsBuilder.newOptions()
        .withOption('order', [0, 'asc'])
        .withOption('bInfo', true)
        .withOption('bLengthChange', false)
        .withDisplayLength(10)
        .withDOM('lfrtip');	
		$scope.dtColumnDefs = [];
		$scope.dtInstance = {};

		var getAllStaffReportReq = {};
		getOrgList();
		
		
		  
		function getOrgList() {
			$log.debug("HELLO 123");
			$scope.organizations = [];
			function getData(num) {
			    var defer = $q.defer();
			    
			    if ($stateParams.partnerId) {
			    	getAllStaffReportReq.partnerId = $stateParams.partnerId;
			    	console.log('$$$$$$')
			    }
			    if(prefix === '/enterprise') {

			    	getAllStaffReportReq.partnerId = '1';
			    }
				$http.post($rootScope.baseUrl+ prefix + '/getOrganizationsByPartnerId', getAllStaffReportReq)
				.success(function(response) {
					var result = {
				        Data: response.partnersOrganization,
				        Columns: num==1?['Organization', 'Edition', 'Billing', 'Leads', 'Created Date', 'Action']:['organizationName', 'currentEditionName', 'isBillingEnabled', 'isLeadEnabled', 'createdDate', 'action']
					};
					defer.resolve(result);
					$log.debug("Assessment Response ", response);
			    }, function(err) {
			        // fail case
			        $log.debug("Error ", err);
			    });

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

		var loggedInPartner = store.get('loginInfo');
		
		$scope.openModal = function(value, obj, index){
			if (value == 'createOrganizationModal')
			{
				$('#'+value).modal('show');	
			}
			else if (value == 'moveOrgModal')
			{
				$('#'+value).modal('show');
				$http.post($rootScope.baseUrl + prefix + '/getLoggedInPartnerAllChilds').then(function (resp) {
					console.log(resp.data);
					$scope.childPartners = resp.data.childPartners;
					var x = _.remove($scope.childPartners, function(v){
						return v.id === loggedInPartner.partnerId;
					});
					
					$scope.changePartnerObj = {
						currentPartnerId: loggedInPartner.partnerId,
						organizationId: obj.organizationId
					};
//					console.log(x);
//					console.log($scope.childPartners);
					console.log($stateParams)
					$scope.$watch( 'abc.currentNode', function( newObj, oldObj ) {
					    if( $scope.abc && angular.isObject($scope.abc.currentNode) ) {
					        console.log( 'Node Selected!!' );
					        console.log( $scope.abc.currentNode );
					        $scope.changePartnerObj.newPartnerId = $scope.abc.currentNode.partnerId;
					        
					    }
					}, false);
				})
				
			}
		}
		
		$scope.viewOrgInfo = function(org){
			$log.debug("Navigation Working", org);
			if ($state.current.name.includes('enterprise_')) {
				$state.go('enterprise_organizationInformation', {obj : org});
			} else {
				$state.go('organizationInformation', {obj : org});
			}
		}
		
		$scope.changePartner = function() {
			$http.post($rootScope.baseUrl + prefix + '/changeOrganizationPartner', $scope.changePartnerObj).then(function(resp) {
	        	console.log(resp.data);
	        	$('#moveOrgModal').modal('hide');
	        	$http.post($rootScope.baseUrl+ prefix + '/getOrganizationsByPartnerId', getAllStaffReportReq).then(function(resp) {
	        		$scope.organizations = resp.data.partnersOrganization;
	        	})
	        });
		}
		
		$scope.addOrg = function(valid) {
			
			if(!valid) {
				return;
			}
			$scope.inviteOrgObj.partnerId = loggedInPartner.partnerId;
			$scope.inviteOrgObj.createdBy = store.get('loggedInEmail');
			console.log($scope.inviteOrgObj);
			$http.post($rootScope.baseUrl + prefix + '/createOrganization', $scope.inviteOrgObj).then(function(resp) {
				console.log(resp);
				if(resp.data.status === 'SUCCESS') {
					toastr.success(resp.data.status)
				}
				else {
					toastr.error(resp.data.remark)
				}
			});
		}
	});
});