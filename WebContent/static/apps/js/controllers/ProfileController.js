angular.module('MetronicApp').controller('ProfileController', function($scope, $http, $log, $location, $timeout, store, $rootScope, $state, DTOptionsBuilder, DTColumnDefBuilder, $q) {
	$scope.$on('$viewContentLoaded', function() {
		getProfileInfo();

		$('.selectpicker').selectpicker({dropupAuto: false, dropdownAlignRight : true, hideDisabled : true});
	function getProfileInfo(){
			
			$http.post($rootScope.baseUrl+'/cms/getLoggedInUserContactInfo', {})
			.success(function(response) {
		        $log.debug("Prfofile Request Success ", response);
		        $scope.contactInfo = response;
		        if(response.photoUrl != null){
					$rootScope.profilePicUrl = response.contact.photoUrl;
					store.set('profilePicUrl', $rootScope.profilePicUrl);
		        }
		    }, function(err) {
		        //fail case
		        $log.debug("Error ", err);
		    });	
		}
		
		$scope.showInfo = function(){
			$('#showMobileInfoModal').modal('show');
		}
		
		$scope.openEditProfile = function(obj){
			$log.debug(obj);
			$scope.editStaffObj = obj;
			$scope.staffName =  obj.name;
			$scope.staffEmail =  obj.email;
			$scope.staffMob =  obj.mobilePhone;
			$scope.staffContactNo =  obj.homePhone;
			$scope.staffAddress1 =  obj.homeAddressStreetTwo;
			$scope.staffAddress2 =  obj.homeAddressStreetOne;
			$scope.staffCity =  obj.homeAddressCity;
			$scope.staffPostCode =  obj.homeAddressPostCode;
			$scope.staffState =  obj.homeAddressState;
			$scope.staffCountry =  obj.homeAddressCountry;
			$scope.staffPosition =  obj.designation;
			$scope.staffType =  obj.type;
			$timeout(function(){
				$('.selectpicker').selectpicker('refresh');
			}, 300);
	        $('#editProfileModal').modal('show');
		}
		
		$scope.editProfile = function(isValid, contactInfo){
			if(isValid){
				$log.debug("Edit Staff Obj", contactInfo);
				$http.post($rootScope.baseUrl+'/cms/updatePartnerInformation', contactInfo)
				.success(function(response) {
			        $log.debug("Edit Staff Success ", response);
			    }, function(err) {
			        //fail case
			        $log.debug("Error ", err);
			    });	
			}
		}
		
		$scope.openUploadPhotoModal = function(){
			$('#addMyProfilePhotoModal').modal('show');
		}
		
		$scope.addPhoto = function(isValid){
			if(isValid){
				var fileInput = $('.contactPhotoFile');
			    var maxSize = fileInput.data('max-size');
		        if(fileInput.get(0).files.length){
		            var fileSize = fileInput.get(0).files[0].size; // in bytes
		            if(fileSize>maxSize){
		                toastr.error('File size is more than 5Mb', 'File Size Error');
		            }else{
						var fd = new FormData();
		                fd.append('uploadProfilePhoto', $scope.contactPhoto);
//		                for (var [key, value] of fd.entries()) { 
//		            	  $log.debug(key, value);
//		            	}
		                $http.post('./cms/uploadProfilePhoto', fd, {
		                	headers: {'Content-Type': undefined},
		                	transformRequest: angular.identity
		                }).success(function(response){
		                	$scope.contactPhoto = '';
		                	$log.debug("File Upload Success ", response);
		    				$('#addMyProfilePhotoModal').modal('hide');
		    				$timeout(function(){
		                    	$state.reload();
		    				}, 300);
						}, function(err) {
					        //fail case
					        $log.debug("Error ", err);
					    });	
		            }
		        }else{
	                toastr.error('Please upload a file.', 'File Upload Error');
		        }
			}
		}
		
		$scope.changePasswordModal = function(){
	        $('#changePasswordModal').modal('show');
		}
		
		$scope.createPasswordModal = function(){
	        $('#createPasswordModal').modal('show');
		}
		
		$scope.changePasswordSubmit = function(isValid){
			$log.debug(isValid);
			if(isValid){
				if($scope.changePassword.newPassword != $scope.changePassword.newCPassword){
					toastr.error("Passwords do not match. Please try again.", "Password Error");
				}
				else{
					var changePasswordObj = {
						currentPassword : $scope.changePassword.currentPassword,
						newPassword : $scope.changePassword.newPassword
					}
					$log.debug("Change Password Obj", changePasswordObj);
					$http.post($rootScope.baseUrl+'/cms/changePassword', changePasswordObj)
					.success(function(response) {
						if(response.status == 'Success')
						{
							$scope.changePassword = {};
					        $log.debug("Change Password Success ", response);
							toastr.success(response.remark, "Password Changed Successfully");
					        $('#changePasswordModal').modal('hide');
						}
						else
						{
							toastr.error(response.remark+". Please try again.", "Password Error");
						}
				    }, function(err) {
				        //fail case
				        $log.debug("Error ", err);
				    });	
				}
			}
		}
		
		$scope.createPasswordSubmit = function(isValid){
			$log.debug(isValid);
			if(isValid){
				if($scope.createPassword.newPassword != $scope.createPassword.newCPassword){
					toastr.error("Passwords do not match. Please try again.", "Password Error");
				}
				else{
					var createPasswordObj = {
						contactId: $rootScope.contactId,
						password : $scope.createPassword.newPassword
					}
					$log.debug("Create Password Obj", createPasswordObj);
					$http.post($rootScope.baseUrl+'/cms/createManualPassword', createPasswordObj)
					.success(function(response) {
						if(response.status == 'Success')
						{
							$scope.createPassword = {};
							var loginResponse = store.get('loginInfo');
							if (loginResponse != undefined) {
								store.set('loginInfo', {"orgId": loginResponse.orgId, "edition":loginResponse.edition, "currency": loginResponse.currency, "contactId": loginResponse.contactId, "email": loginResponse.email, "name": loginResponse.name, "sessionId": loginResponse.sessionid, "lastLogin": loginResponse.lastLogin, "role": loginResponse.role, "isBillingEnabled" : loginResponse.isBillingEnabled, "lastBillingDate" : loginResponse.lastBillingDate, "licenseExpiry" : loginResponse.licenseExpiry, 'isLeadEnabled' : loginResponse.isLeadEnabled, 'hasPassword' : true});
								var loginInfo = store.get('loginInfo');
								$rootScope.hasPassword = loginInfo.hasPassword;
					        }
					        $log.debug("Change Password Success ", response);
							toastr.success('Your password has been created successfully', "Password Creation");
					        $('#createPasswordModal').modal('hide');
						}
						else
						{
							toastr.error(response.remark+". Please try again.", "Password Error");
						}
				    }, function(err) {
				        //fail case
				        $log.debug("Error ", err);
				    });	
				}
			}
		}
		
		getLoggedInDevices();
		
		function getLoggedInDevices() {
			  $scope.dtDevicesOptions = {};
			  $scope.dtDevicesOptions = DTOptionsBuilder.newOptions()
		        .withOption('order', [4, 'desc'])
		        .withOption('bInfo', true)
		        .withOption('bLengthChange', false)
		        .withDisplayLength(10)
		        .withDOM('lfrtip');	
			  $scope.dtDevicesColumnDefs = [];
			  $scope.dtInstance = {};
			  $scope.allDevices = [];

			  function getData(num) {
			    var defer = $q.defer();
			    var getAllDevicesReq = {
		    		contactId  : $rootScope.contactId
				}
				$http.post($rootScope.baseUrl+'/cms/getDevicesByContactId', getAllDevicesReq)
				.success(function(response) {
					var result = {
				        Data: response.list,
				        Columns: num==1?['Platform', 'Model', 'IMEI', 'Remote IP', 'Last Login']:['platform', 'model', 'imei', 'remoteIP', 'lastLogin']
					};
					defer.resolve(result);
					$log.debug("Devices Response ", response);
			    }, function(err) {
			        // fail case
			        $log.debug("Error ", err);
			    });

			    return defer.promise;
			  }

			  $scope.dataNum = 0;
				  $scope.dataNum = ($scope.dataNum == 0) ? 1 : 0;
				  $scope.displayTable = false;
			    getData($scope.dataNum).then(function(result) {
			      var i = 0;
			      result.Columns.forEach(function(elem) {
			    	  $scope.dtDevicesColumnDefs.push(DTColumnDefBuilder.newColumnDef(i++).withTitle(elem));
			      });
			      $scope.allDevices = result.Data;
			      $log.debug("Devices Success ", $scope.allDevices);
			      $scope.displayTable = true;
//			      adjustContainerHeight();
			    });
		};
				
	});
});