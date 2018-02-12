angular.module('MetronicApp').controller('UserController', function($scope, $http, $log, $timeout, store, $rootScope, $stateParams, $state, deviceDetector, auth, DTOptionsBuilder, DTColumnDefBuilder, $q) {
	$scope.$on('$viewContentLoaded', function() {
		
		var loginInfo = store.get('loginInfo');
		$scope.openModal = function(value, obj, index){
			$('#' + value).modal('show');
		}
		
		getUsers(); 
		
		function getUsers(){
			$http.post($rootScope.baseUrl + '/cms/listUserForPartner', {}).then(function(resp) {
				console.log(resp);
				$scope.users = resp.data.users;
				console.log($scope.users);
			})
		}
		
		$scope.createUser = function(valid) {
			if(!valid) {
				return;
			}
			var obj = {
				email: $scope.email,
				name: $scope.fullName,
				mobileNumber: $scope.mobile,
				partnerId: loginInfo.partnerId
			}
			
			$http.post($rootScope.baseUrl + '/cms/createUserForPartner', obj).then(function(resp) {
				console.log(resp.data);
				if(resp.data.status === 'SUCCESS') {
					getUsers();
					toastr.success(resp.data.status);
					$('#createUserModal').modal('hide');
					$scope.email = null;
					name: $scope.fullName = null;
					mobileNumber: $scope.mobile = null;
				}
				else {
					toastr.error(resp.data.remark);
				}
			})
			
		}
	});
});