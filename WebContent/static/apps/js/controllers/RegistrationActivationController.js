angular.module('MetronicApp').controller('RegistrationActivationController', function($scope, $http, $location, $log, $timeout, store, $rootScope, $state, $location, deviceDetector, $window) {
	$scope.$on('$viewContentLoaded', function() {
		$scope.registerObj = {};
		$log.debug("Printing URLS ", $location.url());
		var dirtyEmail = $location.url().split('?email=');
		var dirtyEmail2 = dirtyEmail[1]
		$scope.registeredEmail = dirtyEmail2;
		$log.debug("Email ", dirtyEmail2);
		
		var verifyEmailObj = {
			email : $scope.registeredEmail
		}
		
		$log.debug("Verify Email Obj", verifyEmailObj);
		
		
		$scope.setupFirstTimePassword = function(isValid){
			if(isValid){
				if($scope.registerObj.password != $scope.registerObj.cPassword){
					toastr.error("Please try again", "These Passwords Don't Match");
				}
				else
				{
					var registerPasswordObj = {
						email : $scope.registeredEmail,
						password : $scope.registerObj.password
					}
					
					$log.debug("Register Password Obj", registerPasswordObj);
					$http.post($rootScope.baseUrl+'/activation', registerPasswordObj)
					.success(function(response) {
						if(response.status == "SUCCESS"){
							toastr.success("Account Activated");
					        $log.debug("Register Password Success ", response);
					        $scope.registeredPassword = $scope.registerObj.password;
					        $scope.registerObj = {};
					        
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
									
//									$log.debug("Device Type ", $scope.deviceType);
									
								}
								
								
								$log.debug("!Logged In");
								$('#firstTimeLoginDisclaimerModal').modal('show');
//								$state.go('login');
								$.get("https://api.ipify.org?format=jsonp&callback=?", function(response) {
								  $log.debug(response);
								  $scope.remoteIp = response.ip;
								  $.get("https://www.geoplugin.net/json.gp?ip="+response.ip, function(response2) {
									  $log.debug("Info ", response2);
									});
								}, "jsonp")
							}
						}
						else{
							toastr.error(response.remark, "No available license");
					        $log.debug("Register Error Success ", response.remark);
						}
				    }, function(err) {
				        //fail case
				        $log.debug("Error ", err);
				    }).then(function() {
						$scope.doLogin();
				    });
				}
			}
		}
		
		$scope.doLogin = function(){
			var loginObj = {
				userEmail : $scope.registeredEmail,
				userPassword : $scope.registeredPassword,
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
					store.set('loggedInEmail', $scope.registeredEmail);
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
	});
});