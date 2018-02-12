angular.module('MetronicApp').controller('InvoiceTemplateController', function($rootScope, $scope, $http, $timeout, $log, $stateParams, store, $state) {
	$scope.$on('$viewContentLoaded', function() {
			
		$scope.stateParamsObj = $stateParams.obj;
		$scope.orgInfo = store.get('organizationInformation');

		console.log('AAA',$scope.stateParamsObj);

		if ($stateParams.obj == null) {
			$scope.stateParamsObj = store.get('invoiceInfo');
			console.log('LLLL',$scope.stateParamsObj);
			if($scope.stateParamsObj == 'Preview'){
				var invoiceInfoReq = {
					orgId : $scope.orgInfo.organizationId
				}
				$log.debug("Preview Invoice Info Req ", invoiceInfoReq);
				$http.post($rootScope.baseUrl+'/cms/getOrganizationById', invoiceInfoReq)
				.success(function(response) {
					$log.debug("Invoice Info Response ", response);
					$scope.invoiceInfo = response;
					$scope.invoiceInfo.invoice = {};
					$scope.invoiceInfo.items = [];
					var previewObj = {
						unitPrice : "1700",
						amount : "1500"
					}
					$scope.invoiceInfo.items.push(previewObj);
					$scope.invoiceInfo.items[0].studentBillingItems = {};
					$scope.invoiceInfo.items[0].studentBillingItems.billingItemName = "Program Fees";
					$scope.invoiceInfo.items[0].studentBillingItems.unitPrice = "1700";
					$scope.invoiceInfo.items[0].studentBillingItems.amount = "1500";
					$scope.invoiceInfo.invoice.createdDate = "Jan 21, 2017";
					$scope.invoiceInfo.dueDate = "Feb 11, 2017";
					$scope.invoiceInfo.studentName = "Max Junior";
					$scope.invoiceInfo.program = "Infant Program";
					$scope.invoiceInfo.billingPeriod = "Monthly";
					$scope.invoiceInfo.invoice.invoiceAmount = 1500;
					$scope.invoiceInfo.invoice.invoiceTotal = 1500;
					$scope.invoiceInfo.invoice.invoiceNumber = '0001';
			    }, function(err) {
			        // fail case
			        $log.debug("Error ", err);
			    });
			}
			else{
				$scope.subTotal = 0;
				$scope.grandTotal = 0;
				var invoiceInfoReq = {
					invoiceId : $scope.stateParamsObj.studentInvoiceId.toString(),
					orgId : $scope.orgInfo.organizationId
				}
				$log.debug("Invoice Info Req ", invoiceInfoReq);
				$http.post($rootScope.baseUrl+'/cms/getInvoiceInfo', invoiceInfoReq)
				.success(function(response) {
					$log.debug("Invoice Info Response ", response);
					$scope.invoiceInfo = response;
					$scope.invoiceTax = response.invoice.invoiceAmount/response.invoice.tax;
//						angular.forEach(response.items, function(item){
//							$scope.subTotal += item.amount;
//						});
//						if($scope.invoiceInfo.org.taxPercentage > 0){
//							$scope.grandTotal = $scope.subTotal * ($scope.invoiceInfo.org.taxPercentage/100) + $scope.subTotal;
//							$scope.taxAmount = $scope.subTotal * ($scope.invoiceInfo.org.taxPercentage/100);
//						}
//						else{
//							$scope.grandTotal = $scope.subTotal;
//						}
			    }, function(err) {
			        // fail case
			        $log.debug("Error ", err);
			    });
			}
		} 
		else {
			if($scope.stateParamsObj == 'Preview'){
				store.set('invoiceInfo', 'Preview');
				var invoiceInfoReq = {
					orgId : $scope.orgInfo.organizationId
				}
				$log.debug("Preview Invoice Info Req ", invoiceInfoReq);
				$http.post($rootScope.baseUrl+'/cms/getOrganizationById', invoiceInfoReq)
				.success(function(response) {
					$log.debug("Invoice Info Response ", response);
					$scope.invoiceInfo = response;
					$scope.invoiceInfo.invoice = {};
					$scope.invoiceInfo.items = [];
					var previewObj = {
						unitPrice : "1700",
						amount : "1500"
					}
					$scope.invoiceInfo.items.push(previewObj);
					$scope.invoiceInfo.items[0].studentBillingItems = {};
					$scope.invoiceInfo.items[0].studentBillingItems.billingItemName = "Program Fees"
						$scope.invoiceInfo.items[0].studentBillingItems.unitPrice = "1700";
					$scope.invoiceInfo.items[0].studentBillingItems.amount = "1500";
					$scope.invoiceInfo.invoice.createdDate = "Jan 21, 2017";
					$scope.invoiceInfo.dueDate = "Feb 11, 2017";
					$scope.invoiceInfo.studentName = "Max Junior";
					$scope.invoiceInfo.program = "Infant Program";
					$scope.invoiceInfo.billingPeriod = "Monthly";
					$scope.invoiceInfo.invoice.invoiceAmount = 1500;
					$scope.invoiceInfo.invoice.invoiceTotal = 1500;
					$scope.invoiceInfo.invoice.invoiceNumber = '0001';
			    }, function(err) {
			        // fail case
			        $log.debug("Error ", err);
			    });
			}
			else{
				store.set('invoiceInfo', $stateParams.obj);
				$scope.subTotal = 0;
				$scope.grandTotal = 0;
				var invoiceInfoReq = {
					invoiceId : $scope.stateParamsObj.studentInvoiceId.toString(),
					orgId : $scope.orgInfo.organizationId
				}
				$log.debug("Invoice Info Req ", invoiceInfoReq);
				$http.post($rootScope.baseUrl+'/cms/getInvoiceInfo', invoiceInfoReq)
				.success(function(response) {
					$log.debug("Invoice Info Response ", response);
					$scope.invoiceInfo = response;
					$scope.invoiceTax = response.invoice.invoiceAmount/response.invoice.tax;
//						angular.forEach(response.items, function(item){
//							$scope.subTotal += item.amount;
//						});
//						if($scope.invoiceInfo.org.taxPercentage > 0){
//							$scope.grandTotal = $scope.subTotal * ($scope.invoiceInfo.org.taxPercentage/100) + $scope.subTotal;
//							$scope.taxAmount = $scope.subTotal * ($scope.invoiceInfo.org.taxPercentage/100);
//						}
//						else{
//							$scope.grandTotal = $scope.subTotal;
//						}
			    }, function(err) {
			        // fail case
			        $log.debug("Error ", err);
			    });
			}
		}
		
		$scope.goBackToLocation = function(){
			window.history.back();
		}
	});
});