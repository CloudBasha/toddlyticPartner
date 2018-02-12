angular.module('MetronicApp').controller('OrganizationInformationController', function($scope, $http, $log, $stateParams, $timeout, store, $rootScope, $state, deviceDetector, auth, DTOptionsBuilder, DTColumnDefBuilder, iso4217) {
	
	$scope.loginInfo = store.get('loginInfo');

	var prefix = '/cms';
	if ($state.current.name.includes('enterprise_')) {
		prefix = '/enterprise';
	}
	var partnerInfo = $stateParams.partner;
	console.log('DDDDD', partnerInfo)
	$scope.orgUsage = function() {
		var orgId = $scope.orgInfo.organizationId;
   	 	var getAllStaffReportReq = {
			partnerId  : $scope.loginInfo ? $scope.loginInfo.partnerId : '',
			organizationId : orgId
		}
   	 	if (partnerInfo) {
   	 		getAllStaffReportReq.partnerId = partnerInfo.partnerId;
   	 	}
		$http.post($rootScope.baseUrl+ prefix + '/getOrganizationLicenseUsageInfoByOrganizationId', getAllStaffReportReq)
		.success(function(response) {
			$log.debug("Assessment Response ", response);
			$scope.organizationLicenseUsageInfo=response;
	    }, function(err) {
	        // fail case
	        $log.debug("Error ", err);
	    }); 	
    }
	
	$scope.$on('$viewContentLoaded', function() {
			
		if($stateParams.obj == null){
			$scope.orgInfo = store.get('organizationInformation');
		}
		else{
			store.set('organizationInformation', $stateParams.obj);
			$scope.orgInfo = store.get('organizationInformation');
		}
		
		$log.debug("Org Info ", $scope.orgInfo);
		

		$timeout(function(){
			$('.nav-tabs a[data-target="#informationTab"]').tab('show');
		});
		
		if($stateParams.openTab == 'billing'){
			$timeout(function(){
				$('.nav-tabs a[data-target="#schoolBillingTab"]').tab('show');
			});
	    }
		else if($stateParams.openTab == 'purchaseHistory'){
			$timeout(function(){
				$('.nav-tabs a[data-target="#purchaseHistoryTab"]').tab('show');
			});
	    }

        $timeout(function(){
        	$('.selectpicker').selectpicker({dropupAuto: false, dropdownAlignRight : true, hideDisabled : true});
    		$('.toddlyticDatepicker').datepicker({format : 'mm/yyyy', autoclose : true, endDate : moment().format()});
        }, 1000);
        
        getOrgInfoByOrgId();
        
        function getOrgInfoByOrgId(){
        	if (!$scope.orgInfo) {
        		$state.go('login');
        	}
        	$rootScope.orgId = $scope.orgInfo.organizationId;
        	var orgId = $scope.orgInfo.organizationId;
        	 var getAllStaffReportReq = {
 					partnerId:  $scope.loginInfo ? $scope.loginInfo.partnerId : '',
 					organizationId : orgId
 				}
        	 	if (partnerInfo) {
        	 		getAllStaffReportReq.partnerId = partnerInfo.partnerId;
        	 	}
 				$http.post($rootScope.baseUrl+ prefix + '/getOrganizationInfoByOrganizationId', getAllStaffReportReq)
 				.success(function(response) {
 					$log.debug("Org Info Response ", response);
 					$scope.organizationInfo=response;
			    }, function(err) {
			        // fail case
			        $log.debug("Error ", err);
			    });
        }
        $http.post('http://partner:12345@localhost:8080/Toddlytics/partner/getDataForPurchaseNewLicense', {ord_id:"1"}).then(function(resp){
     		console.log('EDITIONS',resp)
     	});
        $scope.getPurchaseHistory();
	});
	
//	$scope.orgBillingDate = moment();
	$('#billingDate').datepicker({format : 'MM yyyy', autoclose : true, endDate : moment().format()});

	$timeout(function(){
        $('#billingDate').datepicker('setDate', moment().format('MM yyyy'));
	}, 300);
	
	$scope.getOrgBilling = function() {
		console.log($scope.orgBillingDate);
		var billingDate = moment($scope.orgBillingDate, 'MMM YYYY').format('DD-MM-YYYY');
		var params = {
			date: billingDate,
			orgId: $scope.orgInfo.organizationId
		}
//		$scope.orgBillingDate = moment($scope.orgBillingDate).format('MM yyyy');
//		console.log($scope.orgBillingDate);
//		$http.post($rootScope.baseUrl + '/cms/getOrgBillingInfo', params).then(function(resp) {
//			console.log(resp);
//			$scope.orgBillingInfo = resp.data.list;
//			
//		});
		
		$scope.dtOrgBillingOptions = {};
		  $scope.dtOrgBillingOptions = DTOptionsBuilder.newOptions()
	        .withOption('order', [0, 'asc'])
	        .withOption('bInfo', true)
	        .withOption('bLengthChange', false)
	        .withDisplayLength(10)
	        .withDOM   ('lfrtip');	
		  $scope.dtOrgBillingColumnDefs = [];
		  $scope.dtInstance = {};
		  $scope.orgBillingInfo = [];

		  function getData(num) {
			return $http.post($rootScope.baseUrl+ prefix + '/getOrgBillingInfo', params)
			.then(function(response) {
				console.log(response)
				var result = {
			        Data: response.data.list,
			        Columns: num==1?['School', 'Expect Income('+$rootScope.orgCurrency+')', 'Collected Income('+$rootScope.orgCurrency+')', 'Shortfall (%)']:['school', 'expectIncome', 'collectedIncome', 'shortfall']
				};
				$log.debug("Billing Response ", response);
				return result;
		    }, function(err) {
		        // fail case
		        $log.debug("Error ", err);
		        return err;
		    });

		  }
		  
		  $scope.dataNum = 0;
		$scope.dataNum = ($scope.dataNum == 0) ? 1 : 0;
		$scope.displayOrgBillingTable = false;
	    getData($scope.dataNum).then(function(result) {
	      var i = 0;
	      console.log('RES', result)
	      result.Columns.forEach(function(elem) {
	    	  $scope.dtOrgBillingColumnDefs.push(DTColumnDefBuilder.newColumnDef(i++).withTitle(elem));
	      });
	      $scope.orgBillingInfo = result.Data;
	      $log.debug("Org Billing Success ", $scope.orgBillingInfo);
	      $scope.displayOrgBillingTable = true;
	      adjustContainerHeight();
	    });
	    
	    $http.post($rootScope.baseUrl + prefix + '/getOrganizationById', {orgId: $scope.orgInfo.organizationId}).then(function(resp) {
	    	console.log(resp.data);
	    	if(resp.data.org.currency != null){
		        $rootScope.currency = iso4217.getCurrencyByCode(resp.data.org.currency);
		        $rootScope.test = $rootScope.currency.code
		        $log.debug('hey, myVar1 has changed!', $rootScope.currency);
		        $rootScope.orgCurrency = $rootScope.currency.symbol;
			}
			else{
				$rootScope.currency = iso4217.getCurrencyByCode('MYR');
		        $log.debug('hey, myVar2 has changed!', $rootScope.currency);
				$rootScope.orgCurrency = $rootScope.currency.symbol;
			}
	    	store.set('orgCurrency', $rootScope.orgCurrency);
	    });
	}
	
	$scope.getPurchaseHistory = function() {
		$http.post($rootScope.baseUrl + prefix + '/getPurchaseOrdersByOrganizationId', {org_id: $scope.orgInfo.organizationId }).then(function(resp) {
			console.log(resp.data.purchaseOrders);
			$scope.purchaseOrders = resp.data.purchaseOrders;
			$scope.dtOptions = DTOptionsBuilder.newOptions()
	          .withOption('order', [2, 'desc'])
	          .withOption('bInfo', true)
	          .withOption('bLengthChange', false)
	          .withDisplayLength(10)
	          .withDOM('lfrtip');
		})
	}
	
	$scope.viewInvoice = function(id, orgId) {
		var invoiceObj = {
			transactionId : id
		};
		$http.post($rootScope.baseUrl+ prefix + '/getPurchaseOrderDetailsByTransactionId', invoiceObj)
		.success(function(response) {
	        $log.debug("Invoice ", response);
			$state.go('buyPurchaseInvoice', {obj : response, orgId: orgId});
	    }, function(err) {
	        //fail case
	        $log.debug("Error ", err);
	    });	
	}
		  
    
    
    function adjustContainerHeight(){
		$timeout(function(){
			$scope.containerHeight = $('#myTabContent').height() + 50;
			$log.debug("Container Height ", $scope.containerHeight);
		}, 300);
	}
    
    $scope.goToOrgProgramBilling = function(billing){
		billing.searchDate = $scope.orgBillingDate;
		$state.go('organizationProgramBilling', {obj : billing});
	}
    
    
	
	
	
//	$scope.getEdition = function(id) {
//		var obj = {
//			editionId: id.toString()
//		};
//		$http.post($rootScope.baseUrl + '/cms/getLicensePricingInfoByEditionId', obj).then(function(resp){
//			console.log(resp);
//		})
//	}
});