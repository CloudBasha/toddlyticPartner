angular.module('MetronicApp').controller('ListPartnersController', function($scope, $http, $log, $timeout, store, $rootScope, $stateParams, $state, deviceDetector, auth, DTOptionsBuilder, DTColumnDefBuilder, $q) {
	$scope.$on('$viewContentLoaded', function() {
		
		$scope.displayTable = false;
		console.log($stateParams);
		$scope.isEnterprise = false;
		var prefix = '/cms';
		var loginInfo = store.get('loginInfo');
		if ($state.current.name.includes('enterprise_')) {
			prefix = '/enterprise';
			$scope.isEnterprise = true;
		}
		if($stateParams.obj == null){
			$scope.partnerInfo = store.get('partnerInformation');
		}
		else{
			store.set('partnerInformation', $stateParams.obj);
			$scope.partnerInfo = store.get('partnerInformation');
		}
		if($stateParams.partners.length) {
			$scope.partnerLinks = $stateParams.partners;
		} else {
			$scope.partnerLinks = [];
		}
		console.log('$$$$$', $scope.partnerLinks);
		console.log($scope.partnerInfo)
		
		$http.post($rootScope.baseUrl + prefix + '/getPartnerDetailsById', {"partnerId": $scope.partnerInfo.partnerId}).then(function(resp){
			console.log(resp);
			$scope.partners = resp.data.childPartners;
			$scope.organizations = resp.data.partnersOrganization;
			console.log('##########', $scope.organizations)
		});
		buildPartnerTables();
		buildOrgTables();
		function buildPartnerTables() {
			$log.debug("HELLO Partner");
			$scope.dtPartnerOptions = {};
			$scope.dtPartnerOptions = DTOptionsBuilder.newOptions()
	        .withOption('order', [0, 'asc'])
	        .withOption('bInfo', true)
	        .withOption('bLengthChange', false)
	        .withDisplayLength(10)
	        .withDOM('lfrtip');	
			$scope.dtPartnerColumnDefs = [];
			$scope.dtInstance = {};
			$scope.partners = [];
	
		  function getData(num) {
		    var defer = $q.defer();
			var result = {
		        Data: $scope.partnerInfo.partners,
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
		    	  $scope.dtPartnerColumnDefs.push(DTColumnDefBuilder.newColumnDef(i++).withTitle(elem));
		      });
		      $scope.partners = result.Data;
		      $log.debug("Partners Success ", $scope.partners);
		      $scope.displayTable = true;
		      $timeout(function(){
		    	  $('[data-toggle="tooltip"]').tooltip(); 
		      }, 300);
		    });
		}
		
		function buildOrgTables() {
			$log.debug("HELLO ORG");
			$scope.dtOrgOptions = {};
			$scope.dtOrgOptions = DTOptionsBuilder.newOptions()
	        .withOption('order', [0, 'asc'])
	        .withOption('bInfo', true)
	        .withOption('bLengthChange', false)
	        .withDisplayLength(10)
	        .withDOM('lfrtip');	
			$scope.dtOrgColumnDefs = [];
			$scope.dtInstance = {};
			$scope.organizations = [];
	
		  function getData(num) {
		    var defer = $q.defer();
			var result = {
		        Data: $scope.partnerInfo.organizations,
		        Columns: num==1?['Organization', 'Edition', 'Billing', 'Leads', 'Created Date', 'Actions']:['organization', 'edition', 'isBillingEnabled', 'isLeadEnabled', 'createdDate', 'actions']
			};
			defer.resolve(result);
	
		    return defer.promise;
		  }
	
		  $scope.dataNum = 0;
			  $scope.dataNum = ($scope.dataNum == 0) ? 1 : 0;
		    getData($scope.dataNum).then(function(result) {
		      var i = 0;
		      result.Columns.forEach(function(elem) {
		    	  $scope.dtOrgColumnDefs.push(DTColumnDefBuilder.newColumnDef(i++).withTitle(elem));
		      });
		      $scope.organizations = result.Data;
		      $log.debug("Organizations Success ", $scope.organizations);
		      $scope.displayOrgTable = true;
		      $timeout(function(){
		    	  $('[data-toggle="tooltip"]').tooltip(); 
		      }, 300);
		    });
		}
		var loggedInPartner = store.get('loginInfo');
		console.log(loggedInPartner);
		
		$scope.viewPartnerInfo = function(org){
			$log.debug("Navigation Working", org);
			$state.go('partnerInformation', {obj : org});
		}
		
		$scope.viewOrgInfo = function(org, partnerInfo){
			$log.debug("Navigation Working", org);
			if (prefix === '/enterprise') {
				$state.go('enterprise_organizationInformation', {obj : org, partner: partnerInfo});
			} else {
				$state.go('organizationInformation', {obj : org, partner: partnerInfo});
			}
			
		}
	
		$scope.listPartners = function(partner, breadcrumb){
			var pl = angular.copy($scope.partnerLinks);
			var partners = pl.length ? pl.concat([partner]) : [$scope.partnerInfo, partner]
			if(breadcrumb) {
				partners = $scope.partnerLinks.slice(0, $scope.partnerLinks.indexOf(partner) + 1);
			}
			
			if ($state.current.name.includes('enterprise_')) {
				$state.go('enterprise_listPartners', {obj : partner, partners: partners}, {reload: true});
			} else {
				$state.go('listPartners', {obj : partner, partners: partners}, {reload: true});
			}
		}
		
		$scope.changePartner = function() {
			$http.post($rootScope.baseUrl + prefix + '/changeParentPartner', $scope.changePartnerObj).then(function(resp) {
	        	console.log(resp.data);
	        	$('#movePartnerModal').modal('hide');
	        	$http.post($rootScope.baseUrl + prefix + '/getPartnerDetailsById', {"partnerId": $scope.partnerInfo.partnerId}).then(function(resp){
	    			console.log(resp);
	    			$scope.partners = resp.data.childPartners;
	    			$scope.organizations = resp.data.partnersOrganization;
	    			console.log('##########', $scope.organizations)
	    		});
	        });
		}
		
		$scope.changePartnerOrg = function() {
			$http.post($rootScope.baseUrl + prefix + '/changeOrganizationPartner', $scope.changePartnerOrgObj).then(function(resp) {
	        	console.log(resp.data);
	        	$('#moveOrgModal').modal('hide');
	        	$http.post($rootScope.baseUrl + prefix + '/getPartnerDetailsById', {"partnerId": $scope.partnerInfo.partnerId}).then(function(resp){
	    			console.log(resp);
	    			$scope.partners = resp.data.childPartners;
	    			$scope.organizations = resp.data.partnersOrganization;
	    			console.log('##########', $scope.organizations)
	    		});
	        });
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

				var params = {
					partnerId: $scope.partnerInfo.partnerId
				}
				if ($scope.partnerLinks.length) {
					params.partnerId = $scope.partnerLinks[0].partnerId;
				}
				$http.post($rootScope.baseUrl + prefix + '/getLoggedInPartnerAllChilds', params).then(function (resp) {
					console.log(resp.data);
					console.log(obj);
					console.log($scope.partnerInfo);
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
					$scope.childPartners = [{
						partnerId: resp.data.partnerId,
						name: resp.data.name,
						childPartners: tmp
					}]
					
					$scope.changePartnerOrgObj = {
						currentPartnerId: $scope.partnerInfo.partnerId,
						organizationId: obj.organizationId
					};
					
					console.log($scope.childPartners);
					$scope.$watch( 'abc.currentNode', function( newObj, oldObj ) {
					    if( $scope.abc && angular.isObject($scope.abc.currentNode) ) {
					        console.log( 'Node Selected!!' );
					        console.log( $scope.abc.currentNode );
					        $scope.changePartnerOrgObj.newPartnerId = $scope.abc.currentNode.partnerId
					        
					    }
					}, false);
				})
			}
			else if (value == 'movePartnerModal')
			{
				$('#'+value).modal('show');
				var params = {
					partnerId: $scope.partnerInfo.partnerId
				}
				if ($scope.partnerLinks.length) {
					params.partnerId = $scope.partnerLinks[0].partnerId;
				}
				console.log($scope.partnerInfo);
				
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
					$scope.childPartners = [{
						partnerId: resp.data.partnerId,
						name: resp.data.name,
						childPartners: tmp
					}]
//					var tmp = resp.data.childPartners;
//					var x = _.remove(tmp, function(p, i, arr) {
//						if(p.partnerId === obj.partnerId) {
//							return true
//						}
//						if(p.childPartners && ) {
//							if(p.)
//						}
//					})
//					var x = _.remove($scope.childPartners, function(v){
//						return v.partnerId === obj.partnerId;
//						
//					});
//					$scope.childPartner.forEach(function(p, i, arr) {
//						if(p.partnerId === obj.partnerId) {
//							return true
//						}
//						if(i) {
//							if(p.)
//						}
//					})
					
					
					$scope.changePartnerObj = {
						childId: obj.partnerId
					};
//					console.log(x);
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
		}

        $timeout(function(){
        	$('.selectpicker').selectpicker({dropupAuto: false, dropdownAlignRight : true, hideDisabled : true});
        }, 1000);
	});
});