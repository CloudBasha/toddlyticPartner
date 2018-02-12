angular.module('MetronicApp').controller('MyPartnersController', function($scope, $http, $log, $timeout, store, $rootScope, $state, deviceDetector, auth, DTOptionsBuilder, DTColumnDefBuilder, $q) {
	$scope.$on('$viewContentLoaded', function() {
		var partners = [];
		$scope.displayTable = false;
		console.log($rootScope.loginInfo);
		var loginInfo = store.get('loginInfo');
		var prefix = '/cms';
		var apiEndP = '';
		if ($state.current.name.includes('enterprise_')) {
			prefix = '/enterprise';
			apiEndP = '/getAllParentPartners';
		}
		else{
			apiEndP = '/getLoggedInPartnerChilds'
		}
		$http.post($rootScope.baseUrl + prefix + apiEndP, {}).then(function(resp){
			console.log(resp);
			$scope.partners = resp.data.childPartners;
			partners = resp.data.childPartners;
		});
		
//		$http.post($rootScope.baseUrl + prefix + '/viewPartnerInformationByPartnerId', {"partnerId": loginInfo.partnerId}).then(function(resp){
//			console.log(resp);
//		});
//		
		
		
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
			$scope.partners = [];
	
		  function getData(num) {
		    var defer = $q.defer();
			var result = {
		        Data: partners,
		        Columns: num==1?['Partner', 'No of Orgs', 'No of Child Partners', 'Actions']:['partner', 'noOfOrgs', 'noOfChildPartners', 'actions']
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
		      $scope.partners = result.Data;
		      $log.debug("Partners Success ", $scope.partners);
		      $scope.displayTable = true;
		      $timeout(function(){
		    	  $('[data-toggle="tooltip"]').tooltip(); 
		      }, 300);
		    });
		}
		
		$scope.openModal = function(value, obj, index){
			if (value == 'createPartnerModal')
			{
				if(obj) {
					$scope.havePartner = obj;
				}
				$('#'+value).modal('show');	
			}
			else if (value == 'createOrganizationModal')
			{
				$('#'+value).modal('show');	
			}
			else if (value == 'addChildPartnerModal')
			{
				$('#'+value).modal('show');	
			}
			else if (value == 'moveOrgModal')
			{
				$('#'+value).modal('show');
				$http.post($rootScope.baseUrl + prefix + '/getLoggedInPartnerAllChilds').then(function (resp) {
					console.log(resp.data);
					console.log(obj);
					$scope.childPartners = resp.data.childPartners;
					var x = _.remove($scope.childPartners, function(v){
						return v.id === obj.partnerId;
					});
					
					$scope.changePartnerObj = {
						childId: obj.partnerId
					};
					console.log(x);
					console.log($scope.childPartners);
					$scope.$watch( 'abc.currentNode', function( newObj, oldObj ) {
					    if( $scope.abc && angular.isObject($scope.abc.currentNode) ) {
					        console.log( 'Node Selected!!' );
					        console.log( $scope.abc.currentNode );
					        $scope.changePartnerObj.parentId = $scope.abc.currentNode.partnerId
					    }
					}, false);
				})
				
			}
			else if (value == 'movePartnerModal')
			{
				$('#'+value).modal('show');
				var params = {};
				if(prefix === '/enterprise') {
					params.partnerId = obj.partnerId;
				}
				
				$http.post($rootScope.baseUrl + prefix + '/getLoggedInPartnerAllChilds', params).then(function (resp) {
					console.log(resp.data);
					console.log(obj);
					var tmp = [];
					resp.data.childPartners.forEach(function(p) {
						if(tmp.findIndex(function(t){return t.partnerId === p.partnerId}) > -1) {
							tmp[tmp.findIndex(function(t){return t.partnerId === p.partnerId})].childPartners = p.childPartners
						}else {
							tmp.push(p)
						}
					});
					var x = _.remove(tmp, function(v){
						return v.partnerId === obj.partnerId;
					});
					console.log(x);
					$scope.childPartners = [{
						partnerId: resp.data.partnerId,
						name: resp.data.name,
						childPartners: tmp
					}]
					
					$scope.changePartnerObj = {
						childId: obj.partnerId
					};

					console.log($scope.childPartners);
					$scope.$watch( 'abc.currentNode', function( newObj, oldObj ) {
					    if( $scope.abc && angular.isObject($scope.abc.currentNode) ) {
					        console.log( 'Node Selected!!' );
					        console.log( $scope.abc.currentNode );
					        $scope.changePartnerObj.parentId = $scope.abc.currentNode.partnerId
					        
					    }
					}, false);
				})
			}
//			$('#' + value).modal()
		}
		
		
		$scope.createPartner = function(valid) {
			if(valid) {	
				console.log($scope.createPartnerObj);
				if($scope.havePartner) {
					$scope.createPartnerObj.partnerId = $scope.havePartner.partnerId;
				} else {
					if (prefix === '/enterprise') {
						$scope.createPartnerObj.partnerId = '1';
					} else {
						$scope.createPartnerObj.partnerId = loginInfo.partnerId;
						
					}
				}

				$http.post($rootScope.baseUrl + prefix + '/createPartner', $scope.createPartnerObj).then(function(resp){
					console.log(resp);
					if(resp.data.status == "SUCCESS"){
						$scope.havePartner = null;
						$scope.createPartnerObj = {};
						$('#createPartnerModal').modal('hide');
						$http.post($rootScope.baseUrl + prefix + '/getLoggedInPartnerChilds', {}).then(function(resp){
							console.log(resp);
							$scope.partners = resp.data.childPartners;
							partners = resp.data.childPartners;
						});
					}
					else{
						toastr.error(resp.data.remark, 'Invite Partner');
					}
				})
			}
		}
		
		$scope.viewPartnerInfo = function(partner){
			$state.go('partnerInformation', {obj : partner});
		}
		
		$scope.listPartners = function(partner){
			if ($state.current.name.includes('enterprise_')) {
				$state.go('enterprise_listPartners', {obj : partner});
			} else {
				$state.go('listPartners', {obj : partner});
			}
		}
		
		$scope.changePartner = function() {
			$http.post($rootScope.baseUrl + prefix + '/changeParentPartner', $scope.changePartnerObj).then(function(resp) {
	        	console.log(resp.data);
	        	$('#moveOrgModal').modal('hide');

	        	$('#movePartnerModal').modal('hide');
	        	$http.post($rootScope.baseUrl + '/cms/getLoggedInPartnerChilds', {}).then(function(resp){
	    			console.log(resp);
	    			$scope.partners = resp.data.childPartners;
	    		});
	        });
		}
		
        $timeout(function(){
        	$('.selectpicker').selectpicker({dropupAuto: false, dropdownAlignRight : true, hideDisabled : true});
        }, 1000);
	});
});