angular.module('MetronicApp').controller('BuyPurchaseInvoiceController', function($rootScope, $scope, $location, $http, $timeout, $log, $stateParams, store, $state) {
	$scope.$on('$viewContentLoaded', function() {
		getOrgInfo();
		$scope.subtotal = '';
		$scope.stateParamsObj = {};
		$scope.stateParamsObj = $stateParams.obj;
		var dateFormat = $stateParams.obj.createdDate.split(' ');
		$scope.stateParamsObj.formattedDate = dateFormat[0];
		var dueDate = moment(dateFormat[0], "DD-MM-YYYY").add(14, 'days').format('DD-MM-YYYY');
		$scope.stateParamsObj.dueDate = dueDate;
		
		if($scope.stateParamsObj.editionName == undefined){
			$scope.stateParamsObj.edition = $scope.stateParamsObj.smsBundleName;
		}
		else if($scope.stateParamsObj.smsBundleName == undefined){
			$scope.stateParamsObj.edition = $scope.stateParamsObj.editionName;
		}
		else{
			$scope.stateParamsObj.edition = $scope.stateParamsObj.editionName;
		}
		
		if($scope.stateParamsObj.noOfSmsPurchased == undefined){
			$scope.stateParamsObj.noOfSmsPurchased = '0';
		}
		
		if($scope.stateParamsObj.edition == 'Professional'){
			var billItems = [
				{
					name : "Management License",
					qty : $stateParams.obj.Management,
					unitPrice : "62"
				},
				{
					name : "Academic License",
					qty : $stateParams.obj.Academic,
					unitPrice : "38"
				},
				{
					name : "Staff License",
					qty : $stateParams.obj.Staff,
					unitPrice : "5"
				},
				{
					name : "SMS Bundle Name - "+$stateParams.obj.edition,
					qty : $stateParams.obj.noOfSmsPurchased,
					unitPrice : "0.10"
				}
			]
		}
		else{
			var billItems = [
				{
					name : "Management License",
					qty : $stateParams.obj.Management,
					unitPrice : "62"
				},
				{
					name : "Academic License",
					qty : $stateParams.obj.Academic,
					unitPrice : "38"
				},
				{
					name : "Staff License",
					qty : $stateParams.obj.Staff,
					unitPrice : "5"
				},
				{
					name : "SMS Bundle Name - "+$stateParams.obj.edition,
					qty : $stateParams.obj.noOfSmsPurchased,
					unitPrice : "0.25"
				}
			]
		}
		$scope.stateParamsObj.billItems = billItems;
		$scope.stateParamsObj.subtotal = $scope.stateParamsObj.amount;
//		$scope.stateParamsObj.taxAmount = ($scope.stateParamsObj.amount * 6) / 100;
		$scope.stateParamsObj.total = parseFloat($scope.stateParamsObj.amount);
		$log.debug($scope.stateParamsObj);
		
		
		 function getOrgInfo(){
	    	var orgInfoReq = {
    			orgId : $rootScope.orgId
	    	}
	    	$http.post($rootScope.baseUrl+'/cms/getOrganizationById', orgInfoReq)
			.success(function(response) {
		        $log.debug("Org Info Success ", response);
		        $scope.orgInfo = response.org;
		    }, function(err) {
		        // fail case
		        $log.debug("Error ", err);
		    });	
	    	
	    }
		 
		$scope.goBackToLocation = function(){
			$state.go('billing', {shortCut : 'purchaseHistory'});
		} 
	});
});