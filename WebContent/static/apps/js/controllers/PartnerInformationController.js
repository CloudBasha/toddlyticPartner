angular.module('MetronicApp').controller('PartnerInformationController', function($scope, $http, $log, $timeout, store, $rootScope, $stateParams, $state, deviceDetector, auth, DTOptionsBuilder, DTColumnDefBuilder, $q) {
	$scope.$on('$viewContentLoaded', function() {
		
		$scope.displayTable = false;
		
		if($stateParams.obj == null){
			$scope.partnerInfo = store.get('partnerInformation');
		}
		else{
			store.set('partnerInformation', $stateParams.obj);
			$scope.partnerInfo = store.get('partnerInformation');
		}
		
		$log.debug("Partner Info ", $scope.partnerInfo);
		

		$timeout(function(){
			$('.nav-tabs a[data-target="#informationTab"]').tab('show');
		});

        $timeout(function(){
        	$('.selectpicker').selectpicker({dropupAuto: false, dropdownAlignRight : true, hideDisabled : true});
    		$('.toddlyticDatepicker').datepicker({format : 'mm/yyyy', autoclose : true, endDate : moment().format()});
        }, 1000);
	});
});