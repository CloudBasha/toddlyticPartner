angular.module('MetronicApp').controller('LoginController', function($scope, $http, $log, $timeout, store, $rootScope, $state, deviceDetector, auth) {
	$scope.$on('$viewContentLoaded', function() {

		$log.debug('Auth Test ', auth);
		$scope.loginObj = {};
		$rootScope.showLoginForm = false;
		$rootScope.loggedIn = store.get('loggedIn');
		if($rootScope.loggedIn  != true){
			$rootScope.showLoginForm = true;
			var deviceInfo = deviceDetector;
			$scope.browser = deviceInfo.browser;
			getDeviceType();
			function getDeviceType(){
				var deviceType = deviceInfo.isMobile();
				if(deviceType == false){
					deviceType = deviceInfo.isDesktop();
					if(deviceType == false){
						deviceType = deviceInfo.isTablet();
						if(deviceType == false){
							deviceType = deviceInfo.isTablet();
						}
						else{
							$scope.deviceType = "Tablet"
						}
					}
					else{
						$scope.deviceType = "Desktop"
					}
				}
				else{
					$scope.deviceType = "Mobile"
				}
				
			}
			
			
			$log.debug("!Logged In");
			$state.go('login');
			$.get("https://api.ipify.org?format=jsonp&callback=?", function(response) {
			  $log.debug(response);
			  $scope.remoteIp = response.ip;
			  $.get("http://www.geoplugin.net/json.gp?ip="+response.ip, function(response2) {
				  $log.debug("Info ", response2);
				});
			}, "jsonp")
		}
		else{
			$state.go('organizations');
		}
		
		$scope.doLogin = function(isValid){
			$log.debug("HELLO1");
			store.set('loggedIn', true);
			if(isValid){
				var loginObj = {
					userEmail : $scope.loginObj.email,
					userPassword : $scope.loginObj.password,
					browsertype : $scope.browser,
					devicetype : $scope.deviceType,
					httpreferer : $scope.remoteIp
				};
				$log.debug("Login Request ", loginObj);
				$http.post($rootScope.baseUrl+'/login', loginObj).success(function(loginResponse) {
					$log.debug("Login Success ", loginResponse);
					if(loginResponse.loginStatus == "SUCCESS"){
						var contactObj = {
							contactId : loginResponse.contactId
						};
						$log.debug("Contact Info Request ", contactObj);
						store.set('loggedIn', true);
						$rootScope.loggedIn = store.get('loggedIn');
						store.set('loginInfo', loginResponse);
						$state.go('organizations');
						store.set('loggedInEmail', $scope.loginObj.email);
					}
					else{
						if(loginResponse.msg != undefined){
							toastr.error(loginResponse.msg, "Login Unsuccessful");
						}
						else{
							toastr.error(loginResponse.remark, "Login Unsuccessful");
						}
					}
				}, function(err) {
					// fail case
					$log.debug("Error ", err);
				});
			}
			else{
				toastr.error("Please enter an email and password.", "Login Error");
			}
		}		
	});
});