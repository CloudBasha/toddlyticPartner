var toddlytic = angular.module("toddlyticApp", ['angular-storage', 'ui.materialize']);
toddlytic.controller("loginController", [ '$scope', '$http', function($scope, $http) {
	 
    $scope.loginObj = {};
    $scope.sendPost = function() {
    	$http.post('./userLogin', $scope.loginObj)
    	.success(function(response) {
            $log.log("Success ", response);
            $scope.message = response;
        }, function(err) {
            //fail case
            $log.log("Error ", err);
        });
 
    };
} ])

.controller("schoolController", [ '$scope', '$http', '$log', '$timeout', 'store', '$rootScope', function($scope, $http, $log, $timeout, store, $rootScope) {
	angular.element(document).ready(function () {
		$timeout(function(){
			document.getElementById('schoolCollapse_0').click();
		}, 100);
    });
	getSchoolList();
	$scope.c_schoolObj = {
		orgId : "1"
	};
	$rootScope.refreshNeeded = false;
	
	$scope.e_schoolObj = {};
	
	function getSchoolList(){
		$scope.l_schoolObj = {
			orgId : "1"
		};
		$http.post('./l_school', $scope.l_schoolObj)
		.success(function(response) {
	        $log.log("Success ", response);
	        $scope.schools = response.list;
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	
	$scope.createSchool = function(){
		$rootScope.refreshNeeded = false;
		$log.log("Create School ", $scope.c_schoolObj);
		$http.post('./c_school', $scope.c_schoolObj)
    	.success(function(response) {
    		$scope.c_schoolObj = {
				orgId : "1"
    		};
            $log.log("Success ", response);
        	$rootScope.refreshNeeded = true;
            getSchoolList();
        }, function(err) {
            //fail case
            $log.log("Error ", err);
        });
	}
	
	$scope.editSchool = function(school){
		$log.log("School ", school);
		$('#editSchoolModal').openModal();
		$scope.s_name = school.schoolName;
		$scope.s_id = school.schoolId;
		$scope.e_schoolObj = {
			 "schoolId" : school.schoolId,
			 "schoolName" : school.schoolName,
			 "companyName" : school.companyName,
			 "companyNo" : school.companyNo,
			 "contactStreetAddressOne" : school.contactStreetAddressOne,
			 "contactStreetAddressTwo" : school.contactStreetAddressTwo,
			 "contactAddressPostCode" : school.contactAddressPostCode,
			 "contactAddressCity" : school.contactAddressCity,
			 "contactAddressState" : school.contactAddressState,
			 "contactAddressCountry" : school.contactAddressCountry,
			 "contactNumber" : parseInt(school.contactNumber),
			 "email" : school.email,
			 "adminContactName" : school.adminContactName,
			 "adminContactNumber" : parseInt(school.adminContactNumber),
			 "billingContactName" : school.billingContactName,
			 "billingContactNumber" : parseInt(school.billingContactNumber)
		};
	}
	
	$scope.showDeleteSchoolConfirm = function(school){
		$('#deleteSchoolConfirmModal').openModal();		
		$scope.deleteSchoolName = school.schoolName;
		$scope.deleteSchoolId = school.schoolId;
	}
	
	$scope.deleteSchool = function(){
		$scope.d_schoolObj = {
			schoolId : $scope.deleteSchoolId,
			contactEmail : "max@maxlabs.io"
		};
		
		$log.log("Delete School ", $scope.d_schoolObj);
		$http.post('./d_school', $scope.d_schoolObj)
    	.success(function(response) {
            $log.log("Success ", response);
            getSchoolList();
        }, function(err) {
            //fail case
            $log.log("Error ", err);
        });
	}
	
	$scope.submitEditSchool = function(){
		$scope.submitObj = $scope.e_schoolObj;
		$scope.submitObj.contactNumber = $scope.e_schoolObj.contactNumber.toString();
		$scope.submitObj.adminContactNumber = $scope.e_schoolObj.adminContactNumber.toString();
		$scope.submitObj.billingContactNumber = $scope.e_schoolObj.billingContactNumber.toString();
		$log.log("Edit School ", $scope.submitObj);
		$http.post('./e_school', $scope.submitObj)
    	.success(function(response) {
    		$scope.e_schoolObj = {};
            $log.log("Success ", response);
            getSchoolList();
        }, function(err) {
            //fail case
            $log.log("Error ", err);
        });
	}
} ])

.controller("menuController", [ '$scope', '$http', '$log', '$timeout', 'store', '$rootScope', '$compile', function($scope, $http, $log, $timeout, store, $rootScope, $compile) {
	angular.element(document).ready(function () {
		$timeout(function(){
			document.getElementById('menuCollapse_0').click();
		}, 500);
    });
	
	$rootScope.$watch('refreshNeeded', function(){
		$log.log("Local schools have Changed ", $rootScope.refreshNeeded);
		if($rootScope.refreshNeeded == true)
		{
			getSchoolList();
		}
    });
	$scope.schoolInfo = [];
	var recipeCount = 0;
	$scope.recipeInfo = []
	$scope.editRecipeInfo = [];
	$scope.addRecipeDivTrackArray = [];
	$scope.editRecipeDivTrackArray = [];
	getSchoolList();
	getMenuList();
	
	$scope.createMenu = function(){
		$log.log("Menu Name ", $scope.menuName);
		$log.log("School Info ", $scope.schoolInfo);
		$scope.c_menuObj = {
			orgId : "1",
			contactEmail : "max@maxlabs.io",
			menuName : $scope.menuName
		};
		$scope.schools = [];
		$http.post('./c_menu', $scope.c_menuObj)
		.success(function(response) {
	        $log.log("Create Menu Success ", response);
	        $scope.menuName = '';
	    	getMenuList();
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	$scope.editMenu = function(menu){
		$log.log("Menu ", menu);
		$('#editMenuModal').openModal();
		$scope.editMenuName = menu.menu.menuName;
		$scope.editMenuId = menu.menu.menuId.toString();
	}
	
	$scope.submitEditMenu = function(){
		var editMenuObj = {
			menuId : $scope.editMenuId,
			menuName : $scope.editMenuName,
			contactEmail : "max@maxlabs.io"
		}
		$log.log("Edit Menu ", editMenuObj);
		$http.post('./e_menu', editMenuObj)
    	.success(function(response) {
    		$scope.editMenuName = {};
            $log.log("Success ", response);
        	getMenuList();
        }, function(err) {
            //fail case
            $log.log("Error ", err);
        });
	}
	
	$scope.showDeleteMenuConfirm = function(menu){
		$('#deleteMenuConfirmModal').openModal();		
		$scope.deleteMenuId = menu.menu.menuId.toString();
		$scope.deleteMenuName = menu.menu.menuName;
	}
	
	$scope.deleteMenu = function(){
		$scope.d_menuObj = {
			menuId : $scope.deleteMenuId,
			contactEmail : "max@maxlabs.io"
		};
		
		$log.log("Delete Menu ", $scope.d_menuObj);
		$http.post('./d_menu', $scope.d_menuObj)
    	.success(function(response) {
            $log.log("Menu Delete Success ", response);
            getMenuList();
        }, function(err) {
            //fail case
            $log.log("Error ", err);
        });
	}
	
	$scope.createMeal = function(){
		$log.log("Recipe Div Track ",$scope.addRecipeDivTrackArray);
		var recipesArray = [];
		angular.forEach($scope.recipeInfo, function(meal){
			recipesArray.push(meal);
		})
		$log.log("Meal Recipes ", recipesArray);
		var createMealObj = {
			mealName : $scope.mealName,
			menuId: $scope.menuId,
			contactEmail : "max@maxlabs.io",
			recipes : recipesArray
		}
		$log.log("Meal Recipe Info", createMealObj);
		$http.post('./c_meal', createMealObj)
		.success(function(response) {
	        $log.log("Menu Success ", response);
	        $scope.recipeInfo = []
	        $scope.mealName ='';
	        $scope.menuId = '';
	        recipeCount = 0;
	        removeDivAfterCreation($scope.addRecipeDivTrackArray);
	        $scope.addRecipeDivTrackArray = [];
			getMenuList();
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });
	}
	
	$scope.editMeal = function(menu, meal){
		$log.log("Menu ", menu);
		$log.log("Meal ", meal);
		$('#editMealModal').openModal();
		$(document).ready(function() {
		    Materialize.updateTextFields();
		    $('select').material_select();
		});
		$scope.editMealName = meal.meal.mealName;
		$scope.editMenuId = menu.menuId;
		$scope.editMenuName = menu.menuName;
		$scope.editMealRecipes = meal.recipe;
		$scope.mealId = meal.meal.mealId;
		$scope.recipeLength = meal.recipe.length;
		$log.log("Menu Id ", $scope.editMealRecipes.recipeId);
	}
	
	//Meal Items
	$scope.submitEditMeal = function(){
		var recipesArray = [];
		$log.log("Edit Menu Id", $scope.editMenuId);
		$log.log("Edit Tracker ", $scope.editRecipeDivTrackArray)
		angular.forEach($scope.editMealRecipes, function(recipe){
			recipesArray.push(recipe.name);
		});
		angular.forEach($scope.editRecipeInfo, function(recipe2){
			recipesArray.push(recipe2);
		});
		$log.log("Edit Recipes ", $scope.editRecipeInfo);
		var editMealObj = {
			menuId : $scope.editMenuId.toString(),
			mealName : $scope.editMealName,
			mealId : $scope.mealId.toString(),
			contactEmail : "max@maxlabs.io",
			recipes : recipesArray
		}
		$log.log("Edit Meal ", editMealObj);
		$http.post('./e_meal', editMealObj)
    	.success(function(response) {
    		$scope.editMenuName = {};
            $log.log("Success ", response);
        	getMenuList();
        	$scope.editRecipeInfo = [];
        	$scope.editRecipeRep = {};
        	removeDivAfterCreation($scope.editRecipeDivTrackArray);
	        $scope.editRecipeDivTrackArray = [];
	        $scope.recipeLength = 0;
        }, function(err) {
            //fail case
            $log.log("Error ", err);
        });
	}
	
	$scope.showDeleteMealConfirm = function(meal){
		$('#deleteMealConfirmModal').openModal();		
		$scope.deleteMealId = meal.meal.mealId.toString();
		$scope.deleteMealName = meal.meal.mealName;
	}
	
	$scope.deleteMeal = function(){
		$scope.d_mealObj = {
			mealId : $scope.deleteMealId,
			contactEmail : "max@maxlabs.io"
		};
		
		$log.log("Delete Meal ", $scope.d_mealObj);
		$http.post('./d_meal', $scope.d_mealObj)
    	.success(function(response) {
            $log.log("Meal Delete Success ", response);
            getMenuList();
        }, function(err) {
            //fail case
            $log.log("Error ", err);
        });
	}
	
	function getSchoolList(){
		$scope.l_schoolObj = {
			orgId : "1"
		};
		$scope.schools = [];
		$http.post('./l_school', $scope.l_schoolObj)
		.success(function(response) {
	        $log.log("School Success ", response);
	        $scope.schools = response.list;
			setTimeout(function() {
			    $('select').material_select();
			}, 2000);
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}   
	
	function getMenuList(){
		$scope.l_menuObj = {
			orgId : "1"
		};
		$http.post('./l_menu', $scope.l_menuObj)
		.success(function(response) {
	        $log.log("List Menu Success ", response);
	        $scope.menus = response.list;
	        setTimeout(function() {
			    $('select').material_select();
			}, 1000);
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	function removeDivAfterCreation(array){
		var removeArray = array;
		angular.forEach(removeArray, function(item){
			$log.log("Remove Item", item);
			$('#'+item).remove();
		});
	}
	
	
	$scope.addRecipe = function(){
		recipeCount++;
		rowNo = recipeCount;
		input = angular.element('<div id="recipeDiv_'+rowNo+'" class="row"><div class="col s5 offset-s6 input-field"><input ng-model="recipeInfo['+rowNo+']" type="text" class="validate col s9" id="recipeItem_'+rowNo+'"/> <label for="recipeItem_'+rowNo+'">Recipe</label><img class="activityModalsDeleteButton" ng-click="deleteRecipeItemEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div></div>');
		$('#recipeDiv').after(input);
		$scope.addRecipeDivTrackArray.push('recipeDiv_'+rowNo);
		$compile(input)($scope);
	}
   
	
	$scope.deleteRecipeItemEntryRow = function(rowId){
		var startRowId = rowId;
		console.log("startRowId ", startRowId);
		$('#recipeDiv_'+startRowId).remove();
		delete $scope.recipeInfo[rowId];
	}
	
	$scope.addEditRecipe = function(){
		$scope.recipeLength++
		rowNo = $scope.recipeLength;
		input = angular.element('<div id="editRecipeDiv_'+rowNo+'" class="row"><div class="col s5 offset-s6 input-field"><input ng-model="editRecipeInfo['+rowNo+']" type="text" class="validate col s9" id="editRecipeItem_'+rowNo+'"/> <label for="editRecipeItem_'+rowNo+'">Recipe</label><img class="activityModalsDeleteButton" ng-click="deleteEditRecipeItemEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div></div>');
		$('#editRecipeDiv').after(input);
		$scope.editRecipeDivTrackArray.push('editRecipeDiv_'+rowNo);
		$compile(input)($scope);
	}
	
	$scope.deleteServerEditRecipeItemEntryRow = function(rowId , meals){
		var startRowId = rowId;
		console.log("startRowId ", startRowId);
		$('#editRecipeDiv_'+startRowId).remove();
//		delete $scope.editRecipeInfo[rowId];
		meals.splice(rowId, 1);
	}
	
	$scope.deleteEditRecipeItemEntryRow = function(rowId){
		var startRowId = rowId;
		console.log("startRowId ", startRowId);
		$('#editRecipeDiv_'+startRowId).remove();
		delete $scope.editRecipeInfo[rowId];
	}
} ])

.controller("packagesController", [ '$scope', '$http', '$log', '$timeout', 'store', '$rootScope', '$compile', function($scope, $http, $log, $timeout, store, $rootScope, $compile) {
	angular.element(document).ready(function () {
		$timeout(function(){
			document.getElementById('packageCollapse_0').click();
		}, 500);
    });
	
//	$rootScope.$watch('refreshNeeded', function(){
//		$log.log("Local schools have Changed ", $rootScope.refreshNeeded);
//		if($rootScope.refreshNeeded == true)
//		{
//			getSchoolList();
//		}
//    });
//	$scope.schoolInfo = [];

	$scope.optionInfo = [];
	$scope.packageObj = {};
	$scope.packageSchools = [];
	var optionCount = 0;
	$scope.addOptionsDivTrackArray = [];
	$scope.editOptionsDivTrackArray = [];
	$scope.editPackageSchool = [];
	$scope.editOptionInfo = [];

	getSchoolList();
	getPackageList();

	$scope.createPackage = function(){
		var optionsArray = [];
		var schoolsArray = [];
		angular.forEach($scope.optionInfo, function(option){
			optionsArray.push(option);
		});
		angular.forEach($scope.packageSchools, function(schools){
			schoolsArray.push(schools.toString());
		});
		$log.log("Package Name ", $scope.packageObj.name);
		$log.log("Package Description ", $scope.packageObj.description);
		$log.log("Package School Info ", schoolsArray);
		$log.log("Package Options Info ", optionsArray);
		var createPackageObj = {
			packageName : $scope.packageObj.name,
			packageDescription : $scope.packageObj.description,
			schoolIds : schoolsArray,
			options : optionsArray,
			contactEmail : "max@maxlabs.io"
		}
		$log.log("Create Package Obj", createPackageObj);
		$http.post('./c_package', createPackageObj)
		.success(function(response) {
	        $log.log("Create Package Success ", response);
	    	getPackageList();
	    	$scope.optionInfo = [];
	    	$scope.packageObj = {};
	    	$scope.packageSchools = [];
	    	var select = $('select');
	    	select.prop('selectedIndex', 0);
			select.material_select();
			optionCount = 0;
	        removeDivAfterCreation($scope.addOptionsDivTrackArray);
	        $scope.addOptionsDivTrackArray = [];
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	$scope.editPackage = function(packageObj){
		var packageSchools;
		$log.log("Package ", packageObj);
		$('#editPackageModal').openModal();
		$(document).ready(function() {
		    Materialize.updateTextFields();
		    $('select').material_select();
		});
		$scope.packageId = packageObj._package.packageId;
		$scope.editPackageName = packageObj._package.packageName;
		$scope.editPackageDescription = packageObj._package.packageDescription;
		packageSchools = packageObj.schoolList;
		angular.forEach(packageSchools, function(school){
			$scope.editPackageSchool.push(school.schoolId);
		});
		$log.log("editPackageSchool ", $scope.editPackageSchool);
		$scope.optionLength = packageObj.optionList.length;
		$scope.editOptions = packageObj.optionList;
	}
	
	$scope.submitEditPackage = function(){
		var optionsArray = [];
		var schoolsArray = [];
		$log.log("Options ", $scope.editOptions);
		angular.forEach($scope.editOptions, function(option){
			optionsArray.push(option.optionName);
		});
		angular.forEach($scope.editOptionInfo, function(option2){
			optionsArray.push(option2);
		});
		angular.forEach($scope.editPackageSchool, function(school){
			schoolsArray.push(school.toString());
		});
		$log.log("Options Array ", optionsArray);
		var editPackageObj = {
			packageId : $scope.packageId.toString(),
			packageName : $scope.editPackageName,
			packageDescription : $scope.editPackageDescription,
			schoolIds : schoolsArray,
			contactEmail : "max@maxlabs.io",
			options : optionsArray
		}
		$log.log("Edit Package ", editPackageObj);
		$http.post('./e_package', editPackageObj)
    	.success(function(response) {
    		$scope.editPackageName = {};
            $log.log("Success ", response);
        	getPackageList();
        	$scope.editOptionInfo = [];
        	$scope.editOptionRep = {};
        	removeDivAfterCreation($scope.editOptionsDivTrackArray);
	        $scope.editOptionsDivTrackArray = [];
	        $scope.optionLength = 0;
        }, function(err) {
            //fail case
            $log.log("Error ", err);
        });
	}
	
	$scope.showDeletePackageConfirm = function(packageObj){
		$('#deletePackageConfirmModal').openModal();		
		$scope.deletePackageId = packageObj._package.packageId.toString();
		$scope.deletePackageName = packageObj._package.packageName;
	}
	
	$scope.deletePackage = function(){
		$scope.d_pckgObj = {
				packageId : $scope.deletePackageId,
			contactEmail : "max@maxlabs.io"
		};
		
		$log.log("Delete Package ", $scope.d_pckgObj);
		$http.post('./d_package', $scope.d_pckgObj)
    	.success(function(response) {
            $log.log("Package Delete Success ", response);
            getPackageList();
        }, function(err) {
            //fail case
            $log.log("Error ", err);
        });
	}
	
	function getSchoolList(){
		$scope.l_schoolObj = {
			orgId : "1"
		};
		$scope.schools = [];
		$http.post('./l_school', $scope.l_schoolObj)
		.success(function(response) {
	        $log.log("Package Success ", response);
	        $scope.schools = response.list;
			setTimeout(function() {
			    $('select').material_select();
			}, 2000);
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}   
	
	function getPackageList(){
		var packageObj = {
			orgId : "1"
		};
		$http.post('./l_package', packageObj)
		.success(function(response) {
	        $log.log("Package Success ", response);
	        $scope.packages = response.list;
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	function removeDivAfterCreation(array){
		var removeArray = array;
		angular.forEach(removeArray, function(item){
			$log.log("Remove Item", item);
			$('#'+item).remove();
		});
	}
	
	
	$scope.addPackageOption = function(){
		optionCount++;
		rowNo = optionCount;
		input = angular.element('<div id="optionDiv_'+rowNo+'" class="row"><div class="col s6 offset-s6 input-field"><input ng-model="optionInfo['+rowNo+']" type="text" class="validate col s9" id="optionItem_'+rowNo+'"/> <label for="optionItem_'+rowNo+'">Options</label><img class="activityModalsDeleteButton" ng-click="deleteOptionItemEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div></div>');
		$('#optionDiv').after(input);
		$scope.addOptionsDivTrackArray.push('optionDiv_'+rowNo);
		$compile(input)($scope);
	}
   
	
	$scope.deleteOptionItemEntryRow = function(rowId){
		var startRowId = rowId;
		console.log("startRowId ", startRowId);
		$('#optionDiv_'+startRowId).remove();
		delete $scope.optionInfo[rowId];
	}
	
	$scope.addEditPackageOption = function(){
		$scope.optionLength++
		rowNo = $scope.optionLength;
		input = angular.element('<div id="editOptionDiv_'+rowNo+'" class="row"><div class="col s5 offset-s6 input-field"><input ng-model="editOptionInfo['+rowNo+']" type="text" class="validate col s9" id="editOptionItem_'+rowNo+'"/> <label for="editOptionItem_'+rowNo+'">Recipe</label><img class="activityModalsDeleteButton" ng-click="deleteEditPackageOptionItemEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div></div>');
		$('#editOptionDiv').after(input);
		$scope.editOptionsDivTrackArray.push('editOptionDiv_'+rowNo);
		$compile(input)($scope);
	}
	
	$scope.deleteServerPackageOptionItemEntryRow = function(rowId , packages){
		var startRowId = rowId;
		console.log("startRowId ", startRowId);
		$('#editOptionDiv_'+startRowId).remove();
		packages.splice(rowId, 1);
	}
	
	$scope.deleteEditPackageOptionItemEntryRow = function(rowId){
		var startRowId = rowId;
		console.log("startRowId ", startRowId);
		$('#editOptionDiv_'+startRowId).remove();
		delete $scope.editOptionInfo[rowId];
	}
} ])

.controller("roomController", [ '$scope', '$http', '$log', '$timeout', 'store', '$rootScope', '$compile', function($scope, $http, $log, $timeout, store, $rootScope, $compile) {
	
	getSchoolList();
	getRoomsList();
	$scope.editRoomFacilities = [];
	$scope.facilities = {};
	$scope.facilities.ws = false;
	$scope.facilities.ms = false;
	$scope.facilities.wc = false;
	$scope.facilities.oa = false;
	$scope.facilities.cr = false;
	$scope.facilities.wf = false;
	$scope.addRoom = {};
	$scope.createRoom = function(){
		var facilities = [
		{
			weightingScale : $scope.facilities.ws
		},
		{
			motionSensor : $scope.facilities.ms
		},
		{
			webCam : $scope.facilities.wc
		},
		{
			openArea : $scope.facilities.oa
		},
		{
			classroom : $scope.facilities.cr
		},
		{
			wifi : $scope.facilities.wf
		}];
		var createRoomObj = {
			roomName : $scope.addRoom.name,
			roomDescription : $scope.addRoom.description,
			squareArea : $scope.addRoom.area.toFixed(2),
			schoolId : $scope.roomSchool.toString(),
			facilities : facilities,
			contactEmail : "max@maxlabs.io"
		}
		$log.log("Create Room Obj", createRoomObj);
		$http.post('./c_room', createRoomObj)
		.success(function(response) {
	        $log.log("Create Room Success ", response);
	        getRoomsList();
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	$scope.editRoom = function(roomObj){
		var packageSchools;
		$log.log("Room ", roomObj);
		$('#editRoomModal').openModal();
		$(document).ready(function() {
		    Materialize.updateTextFields();
		    $('select').material_select();
		});
		$scope.editRoomId = roomObj.roomId;
		$scope.editRoomName = roomObj.roomName;
		$scope.editRoomDescription = roomObj.roomDescription;
		$scope.editRoomSchool = roomObj.schoolId;
		$scope.editRoomArea = roomObj.squareArea;
		
		$scope.editFacilities = [];
		$scope.editFacilities.ws = roomObj.weightingScale;
		$scope.editFacilities.ms = roomObj.motionSensor;
		$scope.editFacilities.wc = roomObj.webCam;
		$scope.editFacilities.oa = roomObj.openArea;
		$scope.editFacilities.cr = roomObj.classroom;
		$scope.editFacilities.wf = roomObj.wifi;
	}
	
	$scope.submitEditRoom = function(){
		var facilities = [
		{
			weightingScale : $scope.editFacilities.ws
		},
		{
			motionSensor : $scope.editFacilities.ms
		},
		{
			webCam : $scope.editFacilities.wc
		},
		{
			openArea : $scope.editFacilities.oa
		},
		{
			classroom : $scope.editFacilities.cr
		},
		{
			wifi : $scope.editFacilities.wf
		}];
		var editRoomObj = {
			roomId : $scope.editRoomId.toString(),
			roomName : $scope.editRoomName,
			roomDescription : $scope.editRoomDescription,
			squareArea : $scope.editRoomArea.toFixed(2),
			contactEmail : "max@maxlabs.io",
			schoolId : $scope.editRoomSchool.toString(),
			facilities : facilities
		}
		$log.log("Edit Room ", editRoomObj);
		$http.post('./e_room', editRoomObj)
    	.success(function(response) {
            $log.log("Success ", response);
        	getRoomsList();
        	$scope.editRoomId = '';
    		$scope.editRoomName = '';
    		$scope.editRoomDescription = '';
    		$scope.editRoomSchool = '';
    		$scope.editRoomArea = '';
    		$scope.editFacilities = [];
        }, function(err) {
            //fail case
            $log.log("Error ", err);
        });
	}
	
	$scope.showDeleteRoomConfirm = function(roomObj){
		$('#deleteRoomConfirmModal').openModal();		
		$scope.deleteRoomId = roomObj.roomId.toString();
		$scope.deleteRoomName = roomObj.roomName;
	}
	
	$scope.deleteRoom = function(){
		$scope.d_roomObj = {
			roomId : $scope.deleteRoomId,
			contactEmail : "max@maxlabs.io"
		};
		
		$log.log("Delete Room ", $scope.d_roomObj);
		$http.post('./d_room', $scope.d_roomObj)
    	.success(function(response) {
            $log.log("Package Room Success ", response);
            getRoomsList();
        }, function(err) {
            //fail case
            $log.log("Error ", err);
        });
	}
	
	function getSchoolList(){
		$scope.l_schoolObj = {
			orgId : "1"
		};
		$scope.schools = [];
		$http.post('./l_school', $scope.l_schoolObj)
		.success(function(response) {
	        $log.log("Room Success ", response);
	        $scope.schools = response.list;
			setTimeout(function() {
			    $('select').material_select();
			}, 2000);
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	} 
	
	function getRoomsList(){
		var roomObj = {
			orgId : "1"
		};
		$http.post('./l_room', roomObj)
		.success(function(response) {
	        $log.log("Room Success ", response);
	        $scope.rooms = response.list;      
	        
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
} ])

.controller("servicesController", [ '$scope', '$http', '$log', '$timeout', 'store', '$rootScope', '$compile', function($scope, $http, $log, $timeout, store, $rootScope, $compile) {
	
	getSchoolList();
	getServicesList();
	
	$scope.addNewService = function(){
		var createServiceObj = {
			serviceType : $scope.serviceType,
			schoolId : $scope.schoolId.toString(),
			personName : $scope.personName,
			personEmail : $scope.personEmail,
			personMobile : $scope.personMobile,
			officeTel : $scope.officeTel,
			vehicle : $scope.vehicle,
			model : $scope.model,
			make : $scope.make,
			capacity : $scope.capacity.toString(),
			color : $scope.color,
			contactEmail : "max@maxlabs.io"
		}
		$log.log("Create Service Obj", createServiceObj);
		$http.post('./c_service', createServiceObj)
		.success(function(response) {
	        $log.log("Create Service Success ", response);
	        $scope.schoolId = '';
	        $scope.serviceType = '';
	        $(document).ready(function() {
			    $('select').material_select();
			});
	        getServicesList();
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	$scope.editService = function(serviceObj){
		$log.log("Service ", serviceObj);
		$('#editServicesModal').openModal();
		$(document).ready(function() {
		    Materialize.updateTextFields();
		    $('select').material_select();
		});
		$scope.editServiceId = serviceObj.serviceId;
		$scope.editName = serviceObj.personName;
		$scope.editServiceType = serviceObj.serviceType;
		$scope.editSchoolId = serviceObj.schoolId;
		$scope.editEmail = serviceObj.personEmail;
		$scope.editMobile = serviceObj.personMobile;
		$scope.editOfficeTel = serviceObj.officeTel;
		$scope.editVehicle = serviceObj.vehicle;
		$scope.editModel = serviceObj.model;
		$scope.editMake = serviceObj.make;
		$scope.editCapacity = parseInt(serviceObj.capacity);
		$scope.editColor = serviceObj.color;
	}
	
	$scope.submitEditService = function(){
		var editServiceObj = {
			serviceId : $scope.editServiceId.toString(),
			serviceType: $scope.editServiceType,
			schoolId : $scope.editSchoolId.toString(),
			personName : $scope.editName,
			personEmail : $scope.editEmail,
			personMobile : $scope.editMobile,
			officeTel : $scope.editOfficeTel,
			vehicle : $scope.editVehicle,
			model : $scope.editModel,
			make : $scope.editMake,
			capacity : $scope.editCapacity.toString(),
			color : $scope.editColor,
			contactEmail : "abc@gmail.com"
		}
		$log.log("Edit Service ", editServiceObj);
		$http.post('./e_service', editServiceObj)
    	.success(function(response) {
            $log.log("Success ", response);
        	getServicesList();
        	$scope.editServiceId = '';
    		$scope.editName = '';
    		$scope.editEmail = '';
    		$scope.editOfficeTel = '';
    		$scope.editVehicle = '';
    		$scope.editModel = '';
    		$scope.editMake = '';
    		$scope.editCapacity = '';
    		$scope.editColor = '';
        }, function(err) {
            //fail case
            $log.log("Error ", err);
        });
	}
	
	$scope.showDeleteServiceConfirm = function(serviceObj){
		$('#deleteServiceConfirmModal').openModal();		
		$scope.deleteServiceId = serviceObj.serviceId.toString();
		$scope.deleteServiceName = serviceObj.personName;
	}
	
	$scope.deleteService = function(){
		$scope.d_serviceObj = {
			serviceId : $scope.deleteServiceId,
			contactEmail : "max@maxlabs.io"
		};
		
		$log.log("Delete Service ", $scope.d_serviceObj);
		$http.post('./d_service', $scope.d_serviceObj)
    	.success(function(response) {
            $log.log("Service Delete Success ", response);
            getServicesList();
        }, function(err) {
            //fail case
            $log.log("Error ", err);
        });
	}
	
	function getSchoolList(){
		$scope.l_schoolObj = {
			orgId : "1"
		};
		$scope.schools = [];
		$http.post('./l_school', $scope.l_schoolObj)
		.success(function(response) {
	        $log.log("Service School Success ", response);
	        $scope.schools = response.list;
			setTimeout(function() {
			    $('select').material_select();
			}, 2000);
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	} 
	
	function getServicesList(){
		var servicesObj = {
			orgId : "1"
		};
		$http.post('./l_service', servicesObj)
		.success(function(response) {
	        $log.log("Service Success ", response);
	        $scope.services = response.list;      
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
} ])

.controller("programController", [ '$scope', '$http', '$log', '$timeout', 'store', '$rootScope', '$compile', function($scope, $http, $log, $timeout, store, $rootScope, $compile) {
	
	getProgramsList();
	
	$scope.createProgram = function(){
		var createProgramObj = {
			orgId : "1",
			programName : $scope.programName,
			programDescription : $scope.programDecription,
			startAge : $scope.programStartAge.toString(),
			endAge : $scope.programEndAge.toString(),
			contactEmail : "max@maxlabs.io"
		}
		$log.log("Create Program Obj", createProgramObj);
		$http.post('./c_program', createProgramObj)
		.success(function(response) {
	        $log.log("Create Program Success ", response);
	        $scope.programName = '';
	        $scope.programDecription = '';
	        $scope.programStartAge = '';
	        $scope.programEndAge = '';
	        getProgramsList();
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	$scope.editProgram = function(programObj){
		$log.log("Program ", programObj);
		$('#editProgramModal').openModal();
		$(document).ready(function() {
		    Materialize.updateTextFields();
		});
		$scope.editProgramId = programObj.schoolProgramId
		$scope.editProgramName = programObj.programName;
		$scope.editProgramDecription = programObj.programDescription;
		$scope.editProgramStartAge = parseInt(programObj.startAge);
		$scope.editProgramEndAge = parseInt(programObj.endAge);
	}
	
	$scope.submitEditProgram = function(){
		var editProgramObj = {
			programId : $scope.editProgramId.toString(),
			programName : $scope.editProgramName,
			programDescription : $scope.editProgramDecription,
			startAge : $scope.editProgramStartAge.toString(),
			endAge : $scope.editProgramEndAge.toString(),
			contactEmail : "max@maxlabs.io",
		}
		$log.log("Edit Program ", editProgramObj);
		$http.post('./e_program', editProgramObj)
    	.success(function(response) {
            $log.log("Success ", response);
        	getProgramsList();
        	$scope.editProgramId = '';
    		$scope.editProgramName = '';
    		$scope.editProgramDecription = '';
    		$scope.editProgramStartAge = '';
    		$scope.editProgramEndAge = '';
        }, function(err) {
            //fail case
            $log.log("Error ", err);
        });
	}
	
	$scope.showDeleteProgramConfirm = function(programObj){
		$('#deleteProgramConfirmModal').openModal();		
		$scope.deleteProgramId = programObj.schoolProgramId.toString();
		$scope.deleteProgramName = programObj.programName;
	}
	
	$scope.deleteProgram = function(){
		$scope.d_programObj = {
			programId : $scope.deleteProgramId,
			contactEmail : "max@maxlabs.io"
		};
		
		$log.log("Delete Program ", $scope.d_programObj);
		$http.post('./d_program', $scope.d_programObj)
    	.success(function(response) {
            $log.log("Program Delete Success ", response);
            getProgramsList();
        }, function(err) {
            //fail case
            $log.log("Error ", err);
        });
	}
	
	function getProgramsList(){
		var programsObj = {
			orgId : "1"
		};
		$http.post('./l_program', programsObj)
		.success(function(response) {
	        $log.log("Programs Success ", response);
	        $scope.programs = response.list;      
	        $(document).ready(function() {
			    Materialize.updateTextFields();
			});
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
} ])

.controller("programActivityController", [ '$scope', '$http', '$log', '$timeout', 'store', '$rootScope', '$compile', function($scope, $http, $log, $timeout, store, $rootScope, $compile) {
	$(document).ready(function(){
	    $('.tooltipped').tooltip();
	});
	getProgramActivityList();
	var activityItemCount=0;
	$scope.addActivityDivTrackArray = [];
	$scope.editActivityDivTrackArray = [];
	$scope.activityItems = [];
	$scope.editActivityItems = [];
	$scope.editActivityItemsArray = [];
	
	$scope.createActivity = function(activity){
		$('#createActivityModal').openModal();
		$scope.createActivityProgramId = activity.programId;
	}
	
	$scope.createChecklist = function(activity){
		$('#createChecklistModal').openModal();
		$scope.createActivityProgramId = activity.programId;
	}
	
	$scope.addChecklistItem = function(){
		activityItemCount++;
		rowNo = activityItemCount;
		input = angular.element('<div id="activityItemDiv_'+rowNo+'" class="row"><div class="col s12 input-field"><input ng-model="activityItems['+rowNo+']" type="text" class="validate col s9" id="activityItem_'+rowNo+'"/> <label for="activityItem_'+rowNo+'">Item Name</label><img class="activityModalsDeleteButton" ng-click="deleteActivityItemEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div></div>');
		$('#activityItemDiv').after(input);
		$scope.addActivityDivTrackArray.push('activityItemDiv_'+rowNo);
		$compile(input)($scope);
	}
	
	$scope.deleteActivityItemEntryRow = function(rowId){
		var startRowId = rowId;
		console.log("startRowId ", startRowId);
		$('#activityItemDiv_'+startRowId).remove();
		delete $scope.activityItems[rowId];
	}
	
	$scope.addEditChecklistItem = function(){
		$scope.editActivityItemLength++;
		rowNo = $scope.editActivityItemLength;
		$log.log("Row No ", rowNo);
		input = angular.element('<div id="editActivityItemDiv_'+rowNo+'" class="row"><div class="col s12 input-field"><input ng-model="editActivityItemsArray['+rowNo+']" type="text" class="validate col s9" id="editActivityItem_'+rowNo+'"/> <label for="editActivityItem_'+rowNo+'">Item Name</label><img class="activityModalsDeleteButton" ng-click="deleteEditActivityItemEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div></div>');
		$('#editActivityItemDiv').after(input);
		$scope.editActivityDivTrackArray.push('editActivityItemDiv_'+rowNo);
		$compile(input)($scope);
	}
	
	$scope.deleteEditActivityItemEntryRow = function(rowId){
		var startRowId = rowId;
		console.log("startRowId ", startRowId);
		$('#editActivityItemDiv_'+startRowId).remove();
		delete $scope.editActivityItemsArray[rowId];
	}
	
	$scope.deleteServerEditActivityItemEntryRow = function(rowId , items){
		var startRowId = rowId;
		console.log("startRowId ", startRowId);
		$('#editActivityItemDiv_'+startRowId).remove();
//		delete $scope.editRecipeInfo[rowId];
		items.splice(rowId, 1);
	}
	
	$scope.submitCreateActivity = function(activity){
		if(activity == "activity")
		{
			var createProgramActivityObj = {
				programId : $scope.createActivityProgramId.toString(),
				activityName : $scope.activityName,
				activityType : "Activity",
				activityNote : $scope.activityNote,
				activityItems : [],
				contactEmail : "max@maxlabs.io"
			}
			$log.log("Create Program Activity Obj", createProgramActivityObj);
			$http.post('./c_activity', createProgramActivityObj)
			.success(function(response) {
		        $log.log("Create Program Activity Success ", response);
		        $scope.activityName = '';
		        $scope.activityNote = '';
		        getProgramActivityList();
		    }, function(err) {
		        //fail case
		        $log.log("Error ", err);
		    });
		}
		else
		{
			var itemsArray = [];
			angular.forEach($scope.activityItems, function(item){
				if(item != '')
				{
					itemsArray.push(item);
				}
			});
			var createProgramActivityObj = {
				programId : $scope.createActivityProgramId.toString(),
				activityName : $scope.checklistName,
				activityType : "Checklist",
				activityNote : '',
				activityItems : itemsArray,
				contactEmail : "max@maxlabs.io"
			}
			$log.log("Create Program Activity Obj", createProgramActivityObj);
			$http.post('./c_activity', createProgramActivityObj)
			.success(function(response) {
		        $log.log("Create Program Activity Success ", response);
		        $scope.checklistName = '';
		        $scope.activityItems = [];
		        removeDivAfterCreation($scope.addActivityDivTrackArray);
		        getProgramActivityList();
		    }, function(err) {
		        //fail case
		        $log.log("Error ", err);
		    });
		}
	}
	
	$scope.editActivity = function(activityObj){
		$log.log("Activity ", activityObj);
		$('#editActivityModal').openModal();
		$(document).ready(function() {
		    Materialize.updateTextFields();
		});
		$scope.editActivityId = activityObj.activity.activityId;
		$scope.editActivityName = activityObj.activity.activityName;
		$scope.editActivityNote = activityObj.activity.activityNote;
	}
	
	$scope.editChecklist = function(activityObj){
		$log.log("Activity ", activityObj);
		$('#editChecklistModal').openModal();
		$(document).ready(function() {
		    Materialize.updateTextFields();
		});
		$scope.editChecklistId = activityObj.activity.activityId;
		$scope.editChecklistName = activityObj.activity.activityName;
		$scope.editActivityItems = activityObj.activityItems;
		$scope.editActivityItemLength = activityObj.activityItems.length;
	}
	
	$scope.submitEditActivity = function(activity){
		if(activity == "activity")
		{
			var editProgramActivityObj = {
				activityId : $scope.editActivityId.toString(),
				activityName : $scope.editActivityName,
				activityType : "Activity",
				activityNote : $scope.editActivityNote,
				activityItems : [],
				contactEmail : "max@maxlabs.io"
			}
			$log.log("Edit Program Activity Obj", editProgramActivityObj);
			$http.post('./e_activity', editProgramActivityObj)
			.success(function(response) {
		        $log.log("Edit Program Activity Success ", response);
		        $scope.editActivityName = '';
		        $scope.editActivityNote = '';
		        getProgramActivityList();
		    }, function(err) {
		        //fail case
		        $log.log("Error ", err);
		    });
		}
		else
		{
			var itemsArray = [];	
			angular.forEach($scope.editActivityItemsArray, function(item){
				if(item != '')
				{
					itemsArray.push(item);
				}
			});
			angular.forEach($scope.editActivityItems, function(item2){
				itemsArray.push(item2.itemName);
			});
			$log.log(itemsArray);
			var editProgramActivityObj = {
				activityId : $scope.editChecklistId.toString(),
				activityName : $scope.editChecklistName,
				activityType : "Checklist",
				activityNote : '',
				activityItems : itemsArray,
				contactEmail : "max@maxlabs.io"
			}
			$log.log("Edit Program Activity Obj", editProgramActivityObj);
			$http.post('./e_activity', editProgramActivityObj)
			.success(function(response) {
		        $log.log("Edit Program Activity Success ", response);
		        $scope.editChecklistName = '';
		        $scope.editActivityItemsArray = [];
		        removeDivAfterCreation($scope.editActivityDivTrackArray);
		        getProgramActivityList();
		    }, function(err) {
		        //fail case
		        $log.log("Error ", err);
		    });
		}
	}
	
	$scope.viewChecklistItems = function (items){
		$log.log(items);
		$scope.checklistItems = items.activityItems;
		$('#viewCheclistItemsModal').openModal();
	}
	
	$scope.showDeleteActivityConfirm = function(activityObj){
		$('#deleteActivityConfirmModal').openModal();		
		$scope.deleteActivityId = activityObj.activity.activityId.toString();
		$scope.deleteActivityName = activityObj.activity.activityName;
	}
	
	$scope.deleteActivity = function(){
		$scope.d_activityObj = {
			activityId : $scope.deleteActivityId,
			contactEmail : "max@maxlabs.io"
		};
		
		$log.log("Delete Activity ", $scope.d_activityObj);
		$http.post('./d_activity', $scope.d_activityObj)
    	.success(function(response) {
            $log.log("Activity Delete Success ", response);
            getProgramActivityList();
        }, function(err) {
            //fail case
            $log.log("Error ", err);
        });
	}
	
	function getProgramActivityList(){
		var programActivityObj = {
			orgId : "1"
		};
		$http.post('./l_activity', programActivityObj)
		.success(function(response) {
	        $log.log("Program Activity Success ", response);
	        $scope.programActivities = response.list;   
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	function removeDivAfterCreation(array){
		var removeArray = array;
		angular.forEach(removeArray, function(item){
			$log.log("Remove Item", item);
			$('#'+item).remove();
		});
	}
} ])

.controller("peopleController", [ '$scope', '$http', '$log', '$timeout', 'store', '$rootScope', '$compile', '$filter', function($scope, $http, $log, $timeout, store, $rootScope, $compile, $filter) {
	var startCount = 0;
	var endCount = 0;
	var disableEndButton = false;
	var disableStartButton = false;
	var rowNo;

	var bathCount = 0;
	var potty1Count = 0;
	var potty2Count = 0;
	var bottleFeedingCount = 0;
	var medicationCount = 0;
	var emotionCount = 0;
	$scope.startTimeArray = [];
	$scope.endTimeArray = [];
	$scope.bathTimeArray = [];
	$scope.potty1TimeArray = [];
	$scope.potty2TimeArray = [];
	$scope.bottleFeedingTimeArray = [];
	$scope.bottleFeedingQtyArray = [];
	$scope.medicationTimeArray = [];
	$scope.medicationRemarksArray = [];
	$scope.emotionTimeArray = [];
	$scope.emotionValueArray = [];
	
	$scope.addDivTrackArray = [];
	
	$(document).ready(function() {
		loadAllSliderNavs();
		loadStudents();
		renderStudentCharts();
		Materialize.fadeInImage('#studentTab');
		$('ul.tabs').tabs({
			onShow: function(tab) { 
				console.log(tab[0].id)
				if(tab[0].id == 'studentTab')
				{
					loadStudents();
					renderStudentCharts();
					Materialize.fadeInImage('#studentTab');
					$('#studentDashboardDiv').css('display', 'block');
					$('#studentInfoDiv').css('display', 'none');
				}
				else if(tab[0].id == 'parentTab')
				{
					loadParents();
					renderParentCharts();
					Materialize.fadeInImage('#parentTab');
					$('#parentDashboardDiv').css('display', 'block');
					$('#parentInfoDiv').css('display', 'none');
				}
				else if(tab[0].id == 'staffTab')
				{
					loadStaff();
					renderStaffCharts();
					Materialize.fadeInImage('#staffTab');
					$('#staffDashboardDiv').css('display', 'block');
					$('#staffInfoDiv').css('display', 'none');
				}
				else
				{
					loadOthers();
					/* renderStaffCharts(); */
					Materialize.fadeInImage('#othersTab');
					/* $('#staffDashboardDiv').css('display', 'block'); */
					$('#staffInfoDiv').css('display', 'none');
				}
			}
		});
	});
	
	$scope.addStudent = function(){
		var createStudentObj = {
			studentName : $scope.addStudentName,
			studentDob : $scope.addStudentDob,
			orgId : "1",
			contactEmail : "max@maxlabs.io"
		}
		$log.log("Create Student Obj", createStudentObj);
		$http.post('./c_student', createStudentObj)
		.success(function(response) {
	        $log.log("Create Student Success ", response);
	        $scope.addStudentName = '';
	        $scope.addStudentDob = '';
	        getStudentList();
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	$scope.startActivity = function(activity){
		if(activity == 'healthCheck')
		{
			$scope.healthCheck = {};
			$scope.healthCheck.temp = 43;
			$scope.healthCheck.rashes = false;
			$scope.healthCheck.mouthUlcer = false;
			$scope.healthCheck.blisters = '';
			$scope.healthCheck.drooling = false;
			$scope.healthCheck.wateryEyes = false;
			$scope.healthCheck.cough = false;
			$scope.healthCheck.runnyNose = false;
			$scope.healthCheck.virus = false;
			$(document).ready(function() {
			    $('select').material_select();
			});
			$('#healthCheck').openModal();
		}
		else if(activity == 'sleepometer')
		{
			$scope.startTimeArray = [];
			$scope.endTimeArray = [];
			$('#sleepometer').openModal();
		}
		else if(activity == 'hygiene')
		{
			$scope.bathTimeArray = [];
			$scope.potty1TimeArray = [];
			$scope.potty2TimeArray = [];
			$('#hygiene').openModal();
		}
		else if(activity == 'bottleFeeding')
		{
			$scope.bottleFeedingTimeArray = [];
			$scope.bottleFeedingQtyArray = [];
			$('#bottleFeeding').openModal();
		}
		else if(activity == 'medication')
		{
			$scope.medicationTimeArray = [];
			$scope.medicationRemarksArray = [];
			$('#medication').openModal();
		}
		else if(activity == 'emotion')
		{
			$scope.emotionTimeArray = [];
			$scope.emotionValueArray = [];
			$('#emotion').openModal();
		}
	}
	
	$scope.submitActivity = function(activity, student){
		if(activity == 'healthCheck')
		{
			var activityArray = [];
			var startTime = moment().format('YYYY-MM-DD HH:mm:ss');
			var submitActivityObj = {
				trackingType : "healthCheck",
				studentId : student.studentId.toString(),
				quantity : '',
				unit : '',
				value : '',
				remark : '',
				complete_status : '',
				temperature : $scope.healthCheck.temp.toString(),
				rashes : $scope.healthCheck.rashes,
				mouth_ulcer : $scope.healthCheck.mouthUlcer,
				blister : $scope.healthCheck.blisters,
				drooling_saliva : $scope.healthCheck.drooling,
				red_watery_eyes : $scope.healthCheck.wateryEyes,
				cough : $scope.healthCheck.cough,
				runny_nose : $scope.healthCheck.runnyNose,
				virus : $scope.healthCheck.virus,
				start_time : startTime,
				end_time : startTime,
				contactEmail : "max@max.io"
			}
			activityArray.push(submitActivityObj);
			var postActivityObj = {
				tracking_list : activityArray
			}
			$log.log("Create Health Check Obj", postActivityObj);
			$http.post('./c_tracking_list', postActivityObj)
			.success(function(response) {
		        $log.log("Create Health Check Success ", response);
		    }, function(err) {
		        //fail case
		        $log.log("Error ", err);
		    });
		}
		else if(activity == 'sleepometer')
		{
//			$log.log("Start Array ", $scope.startTimeArray);
//			$log.log("End Array ", $scope.endTimeArray);
			var activityArray = [];
			angular.forEach($scope.startTimeArray, function(formatDate){
				var formattedDate = $filter('date')(formatDate, 'yyyy-MM-dd HH:mm:ss');
				var submitActivityObj = {
					trackingType : "sleepoMeter",
					studentId : student.studentId.toString(),
					quantity : '',
					unit : '',
					value : '',
					remark : '',
					complete_status : '',
					temperature : '',
					rashes : false,
					mouth_ulcer : false,
					blister : '',
					drooling_saliva : false,
					red_watery_eyes : false,
					cough : false,
					runny_nose : false,
					virus : false,
					start_time : formattedDate,
					end_time : '',
					contactEmail : "max@max.io"
				}
				activityArray.push(submitActivityObj);
			});
			
			angular.forEach($scope.endTimeArray, function(formatDate){
				var formattedDate = $filter('date')(formatDate, 'yyyy-MM-dd HH:mm:ss');
				var submitActivityObj = {
						trackingType : "sleepoMeter",
						studentId : student.studentId.toString(),
						quantity : '',
						unit : '',
						value : '',
						remark : '',
						complete_status : '',
						temperature : '',
						rashes : false,
						mouth_ulcer : false,
						blister : '',
						drooling_saliva : false,
						red_watery_eyes : false,
						cough : false,
						runny_nose : false,
						virus : false,
						start_time : '',
						end_time : formattedDate,
						contactEmail : "max@max.io"
					}
					activityArray.push(submitActivityObj);
			});
			var postActivityObj = {
				tracking_list : activityArray
			}
			$log.log("Create Sleepometer Obj", postActivityObj);
			$http.post('./c_tracking_list', postActivityObj)
			.success(function(response) {
		        $log.log("Create Sleepometer Success ", response);
				removeDivAfterCreation($scope.addDivTrackArray);
				$scope.addDivTrackArray = [];
				disableEndButtons();
		    }, function(err) {
		        //fail case
		        $log.log("Error ", err);
		    });
		}
		else if(activity == 'hygiene')
		{
//			$log.log("Start Array ", $scope.startTimeArray);
//			$log.log("End Array ", $scope.endTimeArray);
			var activityArray = [];
			$log.log("Bath Array ",$scope.bathTimeArray);
			$log.log("Potty 1 Array ",$scope.potty1TimeArray);
			$log.log("Potty 2 Array ",$scope.potty2TimeArray);
			
			angular.forEach($scope.bathTimeArray, function(formatDate){
				var formattedDate = $filter('date')(formatDate, 'yyyy-MM-dd HH:mm:ss');
				var submitActivityObj = {
					trackingType : "bath",
					studentId : student.studentId.toString(),
					quantity : '',
					unit : '',
					value : '',
					remark : '',
					complete_status : '',
					temperature : '',
					rashes : false,
					mouth_ulcer : false,
					blister : '',
					drooling_saliva : false,
					red_watery_eyes : false,
					cough : false,
					runny_nose : false,
					virus : false,
					start_time : formattedDate,
					end_time : '',
					contactEmail : "max@max.io"
				}
				activityArray.push(submitActivityObj);
			});
			
			angular.forEach($scope.potty1TimeArray, function(formatDate){
				var formattedDate = $filter('date')(formatDate, 'yyyy-MM-dd HH:mm:ss');
				var submitActivityObj = {
						trackingType : "potty1",
						studentId : student.studentId.toString(),
						quantity : '',
						unit : '',
						value : '',
						remark : '',
						complete_status : '',
						temperature : '',
						rashes : false,
						mouth_ulcer : false,
						blister : '',
						drooling_saliva : false,
						red_watery_eyes : false,
						cough : false,
						runny_nose : false,
						virus : false,
						start_time : formattedDate,
						end_time : '',
						contactEmail : "max@max.io"
					}
					activityArray.push(submitActivityObj);
			});
			
			angular.forEach($scope.potty2TimeArray, function(formatDate){
				var formattedDate = $filter('date')(formatDate, 'yyyy-MM-dd HH:mm:ss');
				var submitActivityObj = {
						trackingType : "potty2",
						studentId : student.studentId.toString(),
						quantity : '',
						unit : '',
						value : '',
						remark : '',
						complete_status : '',
						temperature : '',
						rashes : false,
						mouth_ulcer : false,
						blister : '',
						drooling_saliva : false,
						red_watery_eyes : false,
						cough : false,
						runny_nose : false,
						virus : false,
						start_time : formattedDate,
						end_time : '',
						contactEmail : "max@max.io"
					}
					activityArray.push(submitActivityObj);
			});
			var postActivityObj = {
				tracking_list : activityArray
			}
			$log.log("Create Hygiene Obj", postActivityObj);
			$http.post('./c_tracking_list', postActivityObj)
			.success(function(response) {
		        $log.log("Create Hygiene Success ", response);
				removeDivAfterCreation($scope.addDivTrackArray);
				$scope.addDivTrackArray = [];
		    }, function(err) {
		        //fail case
		        $log.log("Error ", err);
		    });
		}
		else if(activity == 'bottleFeeding')
		{
//			$log.log("Start Array ", $scope.startTimeArray);
//			$log.log("End Array ", $scope.endTimeArray);
			var activityArray = [];
			
			angular.forEach($scope.bottleFeedingTimeArray, function(formatDate, key){
				var formattedDate = $filter('date')(formatDate, 'yyyy-MM-dd HH:mm:ss');
				$log.log("key ", key);
				var submitActivityObj = {
					trackingType : "bottleFeeding",
					studentId : student.studentId.toString(),
					quantity : $scope.bottleFeedingQtyArray[key].toString(),
					unit : 'Oz',
					value : '',
					remark : '',
					complete_status : '',
					temperature : '',
					rashes : false,
					mouth_ulcer : false,
					blister : '',
					drooling_saliva : false,
					red_watery_eyes : false,
					cough : false,
					runny_nose : false,
					virus : false,
					start_time : formattedDate,
					end_time : '',
					contactEmail : "max@max.io"
				}
				activityArray.push(submitActivityObj);
			});
			var postActivityObj = {
				tracking_list : activityArray
			}
			$log.log("Create Bottle Feeding Obj", postActivityObj);
			$http.post('./c_tracking_list', postActivityObj)
			.success(function(response) {
		        $log.log("Create Bottle Feeding Success ", response);
				removeDivAfterCreation($scope.addDivTrackArray);
				$scope.addDivTrackArray = [];
		    }, function(err) {
		        //fail case
		        $log.log("Error ", err);
		    });
		}
		else if(activity == 'medication')
		{
//			$log.log("Start Array ", $scope.startTimeArray);
//			$log.log("End Array ", $scope.endTimeArray);
			var activityArray = [];
			angular.forEach($scope.medicationTimeArray, function(formatDate, key){
				var formattedDate = $filter('date')(formatDate, 'yyyy-MM-dd HH:mm:ss');
				$log.log("key ", key);
				var submitActivityObj = {
					trackingType : "medication",
					studentId : student.studentId.toString(),
					quantity : '',
					unit : '',
					value : '',
					remarks : $scope.medicationRemarksArray[key],
					complete_status : '',
					temperature : '',
					rashes : false,
					mouth_ulcer : false,
					blister : '',
					drooling_saliva : false,
					red_watery_eyes : false,
					cough : false,
					runny_nose : false,
					virus : false,
					start_time : formattedDate,
					end_time : '',
					contactEmail : "max@max.io"
				}
				activityArray.push(submitActivityObj);
			});
			var postActivityObj = {
				tracking_list : activityArray
			}
			$log.log("Create Medication Obj", postActivityObj);
			$http.post('./c_tracking_list', postActivityObj)
			.success(function(response) {
		        $log.log("Create Medication Success ", response);
				removeDivAfterCreation($scope.addDivTrackArray);
				$scope.addDivTrackArray = [];
		    }, function(err) {
		        //fail case
		        $log.log("Error ", err);
		    });
		}
		else if(activity == 'emotion')
		{
//			$log.log("Start Array ", $scope.startTimeArray);
//			$log.log("Emotion Array ", $scope.emotionValueArray);
			var activityArray = [];
			angular.forEach($scope.emotionTimeArray, function(formatDate, key){
				var formattedDate = $filter('date')(formatDate, 'yyyy-MM-dd HH:mm:ss');
				$log.log("key ", key);
				var submitActivityObj = {
					trackingType : "emotion",
					studentId : student.studentId.toString(),
					quantity : '',
					unit : '',
					value : $scope.emotionValueArray[key],
					remarks : '',
					complete_status : '',
					temperature : '',
					rashes : false,
					mouth_ulcer : false,
					blister : '',
					drooling_saliva : false,
					red_watery_eyes : false,
					cough : false,
					runny_nose : false,
					virus : false,
					start_time : formattedDate,
					end_time : '',
					contactEmail : "max@max.io"
				}
				activityArray.push(submitActivityObj);
			});
			var postActivityObj = {
				tracking_list : activityArray
			}
			$log.log("Create Emotion Obj", postActivityObj);
			$http.post('./c_tracking_list', postActivityObj)
			.success(function(response) {
		        $log.log("Create Emotion Success ", response);
				removeDivAfterCreation($scope.addDivTrackArray);
				$scope.addDivTrackArray = [];
		    }, function(err) {
		        //fail case
		        $log.log("Error ", err);
		    });
		}
	}
	
	function disableStartButtons(){
		$('#startNapButton').attr('disabled',true);
		$('#endNapButton').attr('disabled',false);
		disableStartButton = true;
		disableEndButton = false;
	}
	
	function disableEndButtons(){
		$('#startNapButton').attr('disabled',false);
		$('#endNapButton').attr('disabled',true);
		disableEndButton = true;
		disableStartButton = false;
	}
	
	$scope.startNapTime = function(){
		var startTime = moment().format('x');
		console.log(startCount);
		if(disableStartButton == false)
		{
			if (startCount == 0) {
				startCount++;
				rowNo = startCount;
				$scope.startTimeArray[rowNo] = startTime;
				input = angular.element('<div id="napTimeDiv_'+rowNo+'" class="row napTimeDiv"><input id="napStartTime_'+rowNo+'" type="text" disabled class="col s3 offset-s6 center" date="hh:mm:ss a" ng-model="startTimeArray['+rowNo+']"/><img class="sleepMeterDeleteEntryButton" ng-click="deleteSleepEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div>');
				$('#napStartEndButtons').after(input);
				$compile(input)($scope);
				$scope.addDivTrackArray.push('napTimeDiv_'+rowNo);
			}
			else if (startCount > 0) {
				rowNo = startCount + 1;
				$scope.startTimeArray[rowNo] = startTime;
				input = angular.element('<div id="napTimeDiv_'+rowNo+'" class="row napTimeDiv"><input id="napStartTime_'+rowNo+'" type="text" disabled class="col s3 offset-s6 center" date="hh:mm:ss a" ng-model="startTimeArray['+rowNo+']"/><img class="sleepMeterDeleteEntryButton" ng-click="deleteSleepEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div>');
				$('#napStartEndButtons').after(input);
				$compile(input)($scope);
				$scope.addDivTrackArray.push('napTimeDiv_'+rowNo);
				startCount++;
			}
			disableStartButtons();
		}
	}
	
	$scope.endNapTime = function(){
		var endTime = moment().format('x');
		console.log(endCount);
		if(disableEndButton == false)
		{
			if (endCount == 0) {
				endCount++;
				$scope.endTimeArray[rowNo] = endTime;
				input = angular.element('<input type="text" disabled id="napEndTime_'+endCount+'" class="col s3 left" date="hh:mm:ss a" ng-model="endTimeArray['+rowNo+']"/>');
				$('#napStartTime_'+startCount).after(input);
				$compile(input)($scope);
				
			}
			else if (endCount > 0) {
				$scope.endTimeArray[rowNo] = endTime;
				input = angular.element('<input type="text" disabled id="napEndTime_'+endCount+'" class="col s3 left" date="hh:mm:ss a" ng-model="endTimeArray['+rowNo+']"/>');
				$('#napStartTime_'+startCount).after(input);
				$compile(input)($scope);
				endCount++;
			}
			disableEndButtons();
		}
	}
	
	$scope.deleteSleepEntryRow = function(rowId){
		var startRowId = rowId;
		var endRowId = parseInt(rowId)-1;
		console.log("startRowId ", startRowId);
		console.log("endRowId ", endRowId);
		$('#napTimeDiv_'+startRowId).remove();
		$('#napEndTime_'+endRowId).remove();
		delete $scope.startTimeArray[rowId];
		delete $scope.endTimeArray[rowId];
	}
	
	$scope.recordBath = function(){
		var time = moment().format('x');
		console.log('Bath Count ', bathCount);
		if (bathCount == 0) {
			bathCount++;
			rowNo = bathCount;
			$scope.bathTimeArray[rowNo] = time;
			input = angular.element('<div id="bathDiv_'+rowNo+'" class="col s5 offset-s6"><input type="text" disabled id="bathTime_'+rowNo+'" class="col s4" date="hh:mm:ss a" ng-model="bathTimeArray['+rowNo+']"/><img class="activityModalsDeleteButton" ng-click="deleteBathEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div>');
			$('#hygieneButtons').after(input);
			$compile(input)($scope);
			$scope.addDivTrackArray.push('bathDiv_'+rowNo);
		}
		else if (bathCount > 0) {
			rowNo = bathCount + 1;
			$scope.bathTimeArray[rowNo] = time;
			input = angular.element('<div id="bathDiv_'+rowNo+'" class="col s5 offset-s6"><input type="text" disabled id="bathTime_'+rowNo+'" class="col s4" date="hh:mm:ss a" ng-model="bathTimeArray['+rowNo+']"/><img class="activityModalsDeleteButton" ng-click="deleteBathEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div>');
			$('#hygieneButtons').after(input);
			$compile(input)($scope);
			$scope.addDivTrackArray.push('bathDiv_'+rowNo);
			bathCount++;
		}
	}
	
	$scope.deleteBathEntryRow = function(rowId){
		var startRowId = rowId;
		console.log("startRowId ", startRowId);
		$('#bathDiv_'+startRowId).remove();
		delete $scope.bathTimeArray[rowId];
	}
	
	$scope.recordPotty1 = function(){
		var time = moment().format('x');
		console.log('Potty 1 Count ', potty1Count);
		if (potty1Count == 0) {
			potty1Count++;
			rowNo = potty1Count;
			$scope.potty1TimeArray[rowNo] = time;
			input = angular.element('<div id="potty1Div_'+rowNo+'" class="col s5 offset-s8"><input type="text" disabled id="potty1Time_'+rowNo+'" class="col s4" date="hh:mm:ss a" ng-model="potty1TimeArray['+rowNo+']"/><img class="activityModalsDeleteButton" ng-click="deletePotty1EntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div>');
			$('#hygieneButtons').after(input);
			$compile(input)($scope);
			$scope.addDivTrackArray.push('potty1Div_'+rowNo);
		}
		else if (potty1Count > 0) {
			rowNo = potty1Count + 1;
			$scope.potty1TimeArray[rowNo] = time;
			input = angular.element('<div id="potty1Div_'+rowNo+'" class="col s5 offset-s8"><input type="text" disabled id="potty1Time_'+rowNo+'" class="col s4" date="hh:mm:ss a" ng-model="potty1TimeArray['+rowNo+']"/><img class="activityModalsDeleteButton" ng-click="deletePotty1EntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div>');
			$('#hygieneButtons').after(input);
			$compile(input)($scope);
			$scope.addDivTrackArray.push('potty1Div_'+rowNo);
			potty1Count++;
		}
	}
	
	$scope.deletePotty1EntryRow = function(rowId){
		var startRowId = rowId;
		console.log("startRowId ", startRowId);
		$('#potty1Div_'+startRowId).remove();
		delete $scope.potty1TimeArray[rowId];
	}
	
	$scope.recordPotty2 = function(){
		var time = moment().format('x');
		console.log('Potty 2 Count ', potty2Count);
		if (potty2Count == 0) {
			potty2Count++;
			rowNo = potty2Count;
			$scope.potty2TimeArray[rowNo] = time;
			input = angular.element('<div id="potty2Div_'+rowNo+'" class="col s5 offset-s10"><input type="text" disabled id="potty2Time_'+rowNo+'" class="col s4" date="hh:mm:ss a" ng-model="potty2TimeArray['+rowNo+']"/><img class="activityModalsDeleteButton" ng-click="deletePotty2EntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div>');
			$('#hygieneButtons').after(input);
			$compile(input)($scope);
			$scope.addDivTrackArray.push('potty2Div_'+rowNo);
		}
		else if (potty2Count > 0) {
			var tempCount = potty2Count + 1;
			rowNo = potty2Count + 1;
			$scope.potty2TimeArray[rowNo] = time;
			input = angular.element('<div id="potty2Div_'+rowNo+'" class="col s5 offset-s10"><input type="text" disabled id="potty2Time_'+rowNo+'" class="col s4" date="hh:mm:ss a" ng-model="potty2TimeArray['+rowNo+']"/><img class="activityModalsDeleteButton" ng-click="deletePotty2EntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div>');
			$('#hygieneButtons').after(input);
			$compile(input)($scope);
			$scope.addDivTrackArray.push('potty2Div_'+rowNo);
			potty2Count++;
		}
	}
	
	$scope.deletePotty2EntryRow = function(rowId){
		var startRowId = rowId;
		console.log("startRowId ", startRowId);
		$('#potty2Div_'+startRowId).remove();
		delete $scope.potty2TimeArray[rowId];
	}
	
	$scope.recordBottleFeeding = function(){
		var time = moment().format('x');
		console.log('Bottle Feeding Count ', bottleFeedingCount);
		if (bottleFeedingCount == 0) {
			bottleFeedingCount++;
			rowNo = bottleFeedingCount;
			$scope.bottleFeedingTimeArray[rowNo] = time;
			input = angular.element('<div id="bottleFeedingDiv_'+rowNo+'" class="row"><input type="text" disabled id="bottleFeedingTime_'+rowNo+'" class="col s2 offset-s6" date="hh:mm:ss a" ng-model="bottleFeedingTimeArray['+rowNo+']"/><input placeholder="Quantity" type="number" class="col s2" style="position: relative;bottom: 20px;right: 10px;" ng-model="bottleFeedingQtyArray['+rowNo+']"/><span>Oz</span><img class="activityModalsDeleteButton" ng-click="deleteBottleFeedingEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div>');
			$('#bottleFeedingButtons').after(input);
			$compile(input)($scope);
			$scope.addDivTrackArray.push('bottleFeedingDiv_'+rowNo);
		}
		else if (bottleFeedingCount > 0) {
			var tempCount = bottleFeedingCount + 1;
			rowNo = bottleFeedingCount + 1;
			$scope.bottleFeedingTimeArray[rowNo] = time;
			input = angular.element('<div id="bottleFeedingDiv_'+rowNo+'" class="row"><input type="text" disabled id="bottleFeedingTime_'+rowNo+'" class="col s2 offset-s6" date="hh:mm:ss a" ng-model="bottleFeedingTimeArray['+rowNo+']"/><input placeholder="Quantity" type="number" class="col s2" style="position: relative;bottom: 20px;right: 10px;" ng-model="bottleFeedingQtyArray['+rowNo+']"/><span>Oz</span><img class="activityModalsDeleteButton" ng-click="deleteBottleFeedingEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div>');
			$('#bottleFeedingButtons').after(input);
			$compile(input)($scope);
			$scope.addDivTrackArray.push('bottleFeedingDiv_'+rowNo);
			bottleFeedingCount++;
		}
	}
	
	$scope.deleteBottleFeedingEntryRow = function(rowId){
		var startRowId = rowId;
		console.log("startRowId ", startRowId);
		$('#bottleFeedingDiv_'+startRowId).remove();
		delete $scope.bottleFeedingTimeArray[rowId];
		delete $scope.bottleFeedingQtyArray[rowId];
	}
	
	$scope.recordMedication = function(){
		var time = moment().format('x');
		console.log('Medication Count ', medicationCount);
		if (medicationCount == 0) {
			medicationCount++;
			rowNo = medicationCount;
			$scope.medicationTimeArray[rowNo] = time;
			input = angular.element('<div id="medicationDiv_'+rowNo+'" class="row"><input type="text" disabled id="medicationTime_'+rowNo+'" class="col s2 offset-s6" date="hh:mm:ss a" ng-model="medicationTimeArray['+rowNo+']"/><input placeholder="Remarks" type="text" class="col s2" style="position: relative;bottom: 20px;right: 10px;" ng-model="medicationRemarksArray['+rowNo+']"/><img class="activityModalsDeleteButton" ng-click="deleteMedicationEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div>');
			$('#medicationButtons').after(input);
			$compile(input)($scope);
			$scope.addDivTrackArray.push('medicationDiv_'+rowNo);
		}
		else if (medicationCount > 0) {
			var tempCount = medicationCount + 1;
			rowNo = medicationCount + 1;
			$scope.medicationTimeArray[rowNo] = time;
			input = angular.element('<div id="medicationDiv_'+rowNo+'" class="row"><input type="text" disabled id="medicationTime_'+rowNo+'" class="col s2 offset-s6" date="hh:mm:ss a" ng-model="medicationTimeArray['+rowNo+']"/><input placeholder="Remarks" type="text" class="col s2" style="position: relative;bottom: 20px;right: 10px;" ng-model="medicationRemarksArray['+rowNo+']"/><img class="activityModalsDeleteButton" ng-click="deleteMedicationEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div>');
			$('#medicationButtons').after(input);
			$compile(input)($scope);
			$scope.addDivTrackArray.push('medicationDiv_'+rowNo);
			medicationCount++;
		}
	}
	
	$scope.deleteMedicationEntryRow = function(rowId){
		var startRowId = rowId;
		console.log("startRowId ", startRowId);
		$('#medicationDiv_'+startRowId).remove();
		delete $scope.medicationTimeArray[rowId];
		delete $scope.medicationRemarksArray[rowId];
	}
	
	$scope.recordEmotion = function(emotion){
		var time = moment().format('x');
		console.log('Emotion Count ', emotionCount);
		switch (emotion) {
		case 'veryUnhappy':
			console.log("Very Unhappy");
			if (emotionCount == 0) {
				emotionCount++;
				rowNo = emotionCount;
				$scope.emotionTimeArray[rowNo] = time;
				$scope.emotionValueArray[rowNo]="Very Unhappy";
				input = angular.element('<div id="emotionDiv_'+rowNo+'" class="row"><div class="col s6 offset-s6"><i style="font-size:23px;" class="material-icons col s2 emotionIcons">sentiment_very_dissatisfied</i><input type="text" disabled id="emotionTime_'+rowNo+'" class="col s4 emotionTrackingTime" date="hh:mm:ss a" ng-model="emotionTimeArray['+rowNo+']"/><img class="emotionDeleteButton" ng-click="deleteEmotionEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div></div>');
				$('#emotionButtons').after(input);
				$compile(input)($scope);
				$scope.addDivTrackArray.push('emotionDiv_'+rowNo);
			}
			else if (emotionCount > 0) {
				var tempCount = emotionCount + 1;
				rowNo = emotionCount + 1;
				$scope.emotionTimeArray[rowNo] = time;
				$scope.emotionValueArray[rowNo]="Very Unhappy";
				input = angular.element('<div id="emotionDiv_'+rowNo+'" class="row"><div class="col s6 offset-s6"><i style="font-size:23px;" class="material-icons col s2 emotionIcons">sentiment_very_dissatisfied</i><input type="text" disabled id="emotionTime_'+rowNo+'" class="col s4 emotionTrackingTime" date="hh:mm:ss a" ng-model="emotionTimeArray['+rowNo+']"/><img class="emotionDeleteButton" ng-click="deleteEmotionEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div></div>');
				$('#emotionButtons').after(input);
				$compile(input)($scope);
				$scope.addDivTrackArray.push('emotionDiv_'+rowNo);
				emotionCount++;
			}
			break;
		case 'unHappy':
			console.log("Unhappy");
			if (emotionCount == 0) {
				emotionCount++;
				rowNo = emotionCount;
				$scope.emotionTimeArray[rowNo] = time;
				$scope.emotionValueArray[rowNo]="Unhappy";
				input = angular.element('<div id="emotionDiv_'+rowNo+'" class="row"><div class="col s6 offset-s6"><i style="font-size:23px;" class="material-icons col s2 emotionIcons">sentiment_dissatisfied</i><input type="text" disabled id="emotionTime_'+rowNo+'" class="col s4 emotionTrackingTime" date="hh:mm:ss a" ng-model="emotionTimeArray['+rowNo+']"/><img class="emotionDeleteButton" ng-click="deleteEmotionEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div></div>');
				$('#emotionButtons').after(input);
				$compile(input)($scope);
				$scope.addDivTrackArray.push('emotionDiv_'+rowNo);
			}
			else if (emotionCount > 0) {
				var tempCount = emotionCount + 1;
				rowNo = emotionCount + 1;
				$scope.emotionTimeArray[rowNo] = time;
				$scope.emotionValueArray[rowNo]="Unhappy";
				input = angular.element('<div id="emotionDiv_'+rowNo+'" class="row"><div class="col s6 offset-s6"><i style="font-size:23px;" class="material-icons col s2 emotionIcons">sentiment_dissatisfied</i><input type="text" disabled id="emotionTime_'+rowNo+'" class="col s4 emotionTrackingTime" date="hh:mm:ss a" ng-model="emotionTimeArray['+rowNo+']"/><img class="emotionDeleteButton" ng-click="deleteEmotionEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div></div>');
				$('#emotionButtons').after(input);
				$compile(input)($scope);
				$scope.addDivTrackArray.push('emotionDiv_'+rowNo);
				emotionCount++;
			}
			break;
		case 'neutral':
			console.log("Neutral");
			if (emotionCount == 0) {
				emotionCount++;
				rowNo = emotionCount;
				$scope.emotionTimeArray[rowNo] = time;
				$scope.emotionValueArray[rowNo]="Neutral";
				input = angular.element('<div id="emotionDiv_'+rowNo+'" class="row"><div class="col s6 offset-s6"><i style="font-size:23px;" class="material-icons col s2 emotionIcons">sentiment_neutral</i><input type="text" disabled id="emotionTime_'+rowNo+'" class="col s4 emotionTrackingTime" date="hh:mm:ss a" ng-model="emotionTimeArray['+rowNo+']"/><img class="emotionDeleteButton" ng-click="deleteEmotionEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div></div>');
				$('#emotionButtons').after(input);
				$compile(input)($scope);
				$scope.addDivTrackArray.push('emotionDiv_'+rowNo);
				
			}
			else if (emotionCount > 0) {
				var tempCount = emotionCount + 1;
				rowNo = emotionCount + 1;
				$scope.emotionTimeArray[rowNo] = time;
				$scope.emotionValueArray[rowNo]="Neutral";
				input = angular.element('<div id="emotionDiv_'+rowNo+'" class="row"><div class="col s6 offset-s6"><i style="font-size:23px;" class="material-icons col s2 emotionIcons">sentiment_neutral</i><input type="text" disabled id="emotionTime_'+rowNo+'" class="col s4 emotionTrackingTime" date="hh:mm:ss a" ng-model="emotionTimeArray['+rowNo+']"/><img class="emotionDeleteButton" ng-click="deleteEmotionEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div></div>');
				$('#emotionButtons').after(input);
				$compile(input)($scope);
				$scope.addDivTrackArray.push('emotionDiv_'+rowNo);
				emotionCount++;
			}
			break;
		case 'happy':
			console.log("Happy");
			if (emotionCount == 0) {
				emotionCount++;
				rowNo = emotionCount;
				$scope.emotionTimeArray[rowNo] = time;
				$scope.emotionValueArray[rowNo]="Happy";
				input = angular.element('<div id="emotionDiv_'+rowNo+'" class="row"><div class="col s6 offset-s6"><i style="font-size:23px;" class="material-icons col s2 emotionIcons">sentiment_satisfied</i><input type="text" disabled id="emotionTime_'+rowNo+'" class="col s4 emotionTrackingTime" date="hh:mm:ss a" ng-model="emotionTimeArray['+rowNo+']"/><img class="emotionDeleteButton" ng-click="deleteEmotionEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div></div>');
				$('#emotionButtons').after(input);
				$compile(input)($scope);
				$scope.addDivTrackArray.push('emotionDiv_'+rowNo);
				
			}
			else if (emotionCount > 0) {
				var tempCount = emotionCount + 1;
				rowNo = emotionCount + 1;
				$scope.emotionTimeArray[rowNo] = time;
				$scope.emotionValueArray[rowNo]="Happy";
				input = angular.element('<div id="emotionDiv_'+rowNo+'" class="row"><div class="col s6 offset-s6"><i style="font-size:23px;" class="material-icons col s2 emotionIcons">sentiment_satisfied</i><input type="text" disabled id="emotionTime_'+rowNo+'" class="col s4 emotionTrackingTime" date="hh:mm:ss a" ng-model="emotionTimeArray['+rowNo+']"/><img class="emotionDeleteButton" ng-click="deleteEmotionEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div></div>');
				$('#emotionButtons').after(input);
				$compile(input)($scope);
				$scope.addDivTrackArray.push('emotionDiv_'+rowNo);
				emotionCount++;
			}
			break;
		case 'veryHappy':
			console.log("Very Happy");
			if (emotionCount == 0) {
				emotionCount++;
				rowNo = emotionCount;
				$scope.emotionTimeArray[rowNo] = time;
				$scope.emotionValueArray[rowNo]="Very Happy";
				input = angular.element('<div id="emotionDiv_'+rowNo+'" class="row"><div class="col s6 offset-s6"><i style="font-size:23px;" class="material-icons col s2 emotionIcons">sentiment_very_satisfied</i><input type="text" disabled id="emotionTime_'+rowNo+'" class="col s4 emotionTrackingTime" date="hh:mm:ss a" ng-model="emotionTimeArray['+rowNo+']"/><img class="emotionDeleteButton" ng-click="deleteEmotionEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div></div>');
				$('#emotionButtons').after(input);
				$compile(input)($scope);
				$scope.addDivTrackArray.push('emotionDiv_'+rowNo);
				
			}
			else if (emotionCount > 0) {
				var tempCount = emotionCount + 1;
				rowNo = emotionCount + 1;
				$scope.emotionTimeArray[rowNo] = time;
				$scope.emotionValueArray[rowNo]="Very Happy";
				input = angular.element('<div id="emotionDiv_'+rowNo+'" class="row"><div class="col s6 offset-s6"><i style="font-size:23px;" class="material-icons col s2 emotionIcons">sentiment_very_satisfied</i><input type="text" disabled id="emotionTime_'+rowNo+'" class="col s4 emotionTrackingTime" date="hh:mm:ss a" ng-model="emotionTimeArray['+rowNo+']"/><img class="emotionDeleteButton" ng-click="deleteEmotionEntryRow('+rowNo+')" src="./images/remove.png" width="30px" height="30px" /></div></div>');
				$('#emotionButtons').after(input);
				$compile(input)($scope);
				$scope.addDivTrackArray.push('emotionDiv_'+rowNo);
				emotionCount++;
			}
			break;
		}
	}
	
	$scope.deleteEmotionEntryRow = function(rowId){
		var startRowId = rowId;
		console.log("startRowId ", startRowId);
		$('#emotionDiv_'+startRowId).remove();
		delete $scope.emotionTimeArray[rowId];
		delete $scope.emotionValueArray[rowId];
	}
	
	function removeDivAfterCreation(array){
//		$log.log("Remove Div Working", array);
		var removeArray = array;
		angular.forEach(removeArray, function(item){
			$log.log("Remove Item", item);
			$('#'+item).remove();
		});
	}
	
		
	$('#studentUploadButton').click(function(){
	    $('input[type=file]').click();
	    return false;
	});
	
	$('#parentUploadButton').click(function(){
	    $('input[type=file]').click();
	    return false;
	});
	
	function renderStudentCharts(){
		var chart1 = new CanvasJS.Chart("studentChart1Container",
	    {
	    
	      title:{
	      text: "Students Intake"
	      },
	       data: [
	      {        
	        type: "spline",
	        
	        dataPoints: [
	        { x: new Date(2016, 00, 1), y: 1352 },
	        { x: new Date(2016, 01, 1), y: 1514 },
	        { x: new Date(2016, 02, 1), y: 1321 },
	        { x: new Date(2016, 03, 1), y: 1163 },
	        { x: new Date(2016, 04, 1), y: 950 },
	        { x: new Date(2016, 05, 1), y: 1201 },
	        { x: new Date(2016, 06, 1), y: 1186 },
	        { x: new Date(2016, 07, 1), y: 1281 },
	        { x: new Date(2016, 08, 1), y: 1438 },
	        { x: new Date(2016, 09, 1), y: 1305 },
	        { x: new Date(2016, 10, 1), y: 1480 },
	        { x: new Date(2016, 11, 1), y: 1291 }        
	        ]
	      }       
	        
	      ]
	    });
		
		var chart2 = new CanvasJS.Chart("studentChart2Container", {
			theme: "theme2",//theme1
			title:{
				text: "Top Students"              
			},
			animationEnabled: false,   // change to true
			data: [              
			{
				// Change type to "bar", "area", "spline", "pie",etc.
				type: "column",
				dataPoints: [
					{ label: "Infant",  y: 10  },
					{ label: "Toddler", y: 15  },
					{ label: "Baby", y: 25  },
					{ label: "Preschool",  y: 30  },
					{ label: "Playschool",  y: 28  }
				]
			}
			]
		});
		chart1.render();
		chart2.render();
	}
	
	function renderParentCharts(){
		var chart1 = new CanvasJS.Chart("parentChart1Container",
	    {
	    
	      title:{
	      text: "Parents Activity"
	      },
	       data: [
	      {        
	        type: "spline",
	        
	        dataPoints: [
	        { x: new Date(2016, 00, 1), y: 1352 },
	        { x: new Date(2016, 01, 1), y: 1514 },
	        { x: new Date(2016, 02, 1), y: 1321 },
	        { x: new Date(2016, 03, 1), y: 1163 },
	        { x: new Date(2016, 04, 1), y: 950 },
	        { x: new Date(2016, 05, 1), y: 1201 },
	        { x: new Date(2016, 06, 1), y: 1186 },
	        { x: new Date(2016, 07, 1), y: 1281 },
	        { x: new Date(2016, 08, 1), y: 1438 },
	        { x: new Date(2016, 09, 1), y: 1305 },
	        { x: new Date(2016, 10, 1), y: 1480 },
	        { x: new Date(2016, 11, 1), y: 1291 }        
	        ]
	      }       
	        
	      ]
	    });
		chart1.render();
		
		var chart2 = new CanvasJS.Chart("parentChart2Container", {
			theme: "theme2",//theme1
			title:{
				text: "Top Parents"              
			},
			animationEnabled: false,   // change to true
			data: [              
			{
				// Change type to "bar", "area", "spline", "pie",etc.
				type: "column",
				dataPoints: [
					{ label: "Infant",  y: 10  },
					{ label: "Toddler", y: 15  },
					{ label: "Baby", y: 25  },
					{ label: "Preschool",  y: 30  },
					{ label: "Playschool",  y: 28  }
				]
			}
			]
		});
		chart2.render();
	}
	
	function renderStaffCharts(){
		var chart1 = new CanvasJS.Chart("staffChart1Container",
	    {
	    
	      title:{
	      text: "Staff Activity"
	      },
	       data: [
	      {        
	        type: "spline",
	        
	        dataPoints: [
	        { x: new Date(2016, 00, 1), y: 1352 },
	        { x: new Date(2016, 01, 1), y: 1514 },
	        { x: new Date(2016, 02, 1), y: 1321 },
	        { x: new Date(2016, 03, 1), y: 1163 },
	        { x: new Date(2016, 04, 1), y: 950 },
	        { x: new Date(2016, 05, 1), y: 1201 },
	        { x: new Date(2016, 06, 1), y: 1186 },
	        { x: new Date(2016, 07, 1), y: 1281 },
	        { x: new Date(2016, 08, 1), y: 1438 },
	        { x: new Date(2016, 09, 1), y: 1305 },
	        { x: new Date(2016, 10, 1), y: 1480 },
	        { x: new Date(2016, 11, 1), y: 1291 }        
	        ]
	      }       
	        
	      ]
	    });
		chart1.render();
		
		var chart2 = new CanvasJS.Chart("staffChart2Container", {
			theme: "theme2",//theme1
			title:{
				text: "Top Staff"              
			},
			animationEnabled: false,   // change to true
			data: [              
			{
				// Change type to "bar", "area", "spline", "pie",etc.
				type: "column",
				dataPoints: [
					{ label: "Infant",  y: 10  },
					{ label: "Toddler", y: 15  },
					{ label: "Baby", y: 25  },
					{ label: "Preschool",  y: 30  },
					{ label: "Playschool",  y: 28  }
				]
			}
			]
		});
		chart2.render();
	}
	

	$scope.alphabet = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
	
	function loadStudents(){
		getStudentList();
		document.getElementById('searchPeopleInputLabel').innerText = 'Search Students';
		Materialize.fadeInImage('#studentContactsSlider');
		$('#studentContactsSlider').css('display', 'block');
		$('#parentContactsSlider').css('display', 'none');
		$('#staffContactsSlider').css('display', 'none');
		$('#otherContactsSlider').css('display', 'none');
//		for (var i = 65; i <= 90; i++) {
//			if(String.fromCharCode(i).toLowerCase()==("j")){
//				var largeHtml = '<ul><li><a href="javascript:void(0)" onclick="selectStudent()"> <img src="./images/yuna.jpg" width="40px" height="40px" class="circle li_student_img" /> John Smith</a></li></ul>'
//				$('#studentContacts-slider_ul').append('<li id="' + String.fromCharCode(i).toLowerCase() + '" class="title"><a name="' + String.fromCharCode(i).toLowerCase() + '" class="title">' + String.fromCharCode(i).toLowerCase() + '</a>' + largeHtml + '</li>');
//			} else if (String.fromCharCode(i).toLowerCase()==("a")){
//				var largeHtml = '<ul><li><a href="javascript:void(0)" onclick="selectStudent()"> <img src="./images/yuna.jpg" width="40px" height="40px" class="circle li_student_img" /> Adam Smith</a></li></ul>'
//				$('#studentContacts-slider_ul').append('<li id="' + String.fromCharCode(i).toLowerCase() + '" class="title"><a name="' + String.fromCharCode(i).toLowerCase() + '" class="title">' + String.fromCharCode(i).toLowerCase() + '</a>' + largeHtml + '</li>');
//			} else {
//				$('#studentContacts-slider_ul').append('<li id="' + String.fromCharCode(i).toLowerCase() + '" class="title"><a name="' + String.fromCharCode(i).toLowerCase() + '" class="title">' + String.fromCharCode(i).toLowerCase() + '</a><ul><li></li></ul></li>');
//			}
//		}
	}
	
	function loadParents(){
		getParentList();
		document.getElementById('searchPeopleInputLabel').innerText = 'Search Parents';
		console.log("Loading Parents");
		Materialize.fadeInImage('#parentContactsSlider');
		$('#parentContactsSlider').css('display', 'block');
		$('#studentContactsSlider').css('display', 'none');
		$('#staffContactsSlider').css('display', 'none');
		$('#otherContactsSlider').css('display', 'none');
//		for (var i = 65; i <= 90; i++) {
//			if(String.fromCharCode(i).toLowerCase()==("j")){
//				var largeHtml = '<ul><li><a href="javascript:void(0)" onclick="selectParent()"> <img src="<%=request.getContextPath()%>/images/yuna.jpg" width="40px" height="40px" class="circle li_student_img" /> Jack Smith</a></li></ul>'
//				$('#parentContacts-slider_ul').append('<li id="' + String.fromCharCode(i).toLowerCase() + '" class="title"><a name="' + String.fromCharCode(i).toLowerCase() + '" class="title">' + String.fromCharCode(i).toLowerCase() + '</a>' + largeHtml + '</li>');
//			} else if (String.fromCharCode(i).toLowerCase()==("a")){
//				var largeHtml = '<ul><li><a href="javascript:void(0)" onclick="selectParent()"> <img src="<%=request.getContextPath()%>/images/yuna.jpg" width="40px" height="40px" class="circle li_student_img" /> Aaron Smith</a></li></ul>'
//				$('#parentContacts-slider_ul').append('<li id="' + String.fromCharCode(i).toLowerCase() + '" class="title"><a name="' + String.fromCharCode(i).toLowerCase() + '" class="title">' + String.fromCharCode(i).toLowerCase() + '</a>' + largeHtml + '</li>');
//			} else {
//				$('#parentContacts-slider_ul').append('<li id="' + String.fromCharCode(i).toLowerCase() + '" class="title"><a name="' + String.fromCharCode(i).toLowerCase() + '" class="title">' + String.fromCharCode(i).toLowerCase() + '</a><ul><li></li></ul></li>');
//			}
//		}
	}
	
	function loadStaff(){
		document.getElementById('searchPeopleInputLabel').innerText = 'Search Staff';
		console.log("Loading Staff");
		Materialize.fadeInImage('#staffContactsSlider');
		$('#staffContactsSlider').css('display', 'block');
		$('#studentContactsSlider').css('display', 'none');
		$('#parentContactsSlider').css('display', 'none');
		$('#otherContactsSlider').css('display', 'none');
		for (var i = 65; i <= 90; i++) {
			if(String.fromCharCode(i).toLowerCase()==("j")){
				var largeHtml = '<ul><li><a href="javascript:void(0)" onclick="selectStaff()"> <img src="<%=request.getContextPath()%>/images/yuna.jpg" width="40px" height="40px" class="circle li_student_img" /> Jeniffer Smith</a></li></ul>'
				$('#staffContacts-slider_ul').append('<li id="' + String.fromCharCode(i).toLowerCase() + '" class="title"><a name="' + String.fromCharCode(i).toLowerCase() + '" class="title">' + String.fromCharCode(i).toLowerCase() + '</a>' + largeHtml + '</li>');
			} else if (String.fromCharCode(i).toLowerCase()==("a")){
				var largeHtml = '<ul><li><a href="javascript:void(0)" onclick="selectStaff()"> <img src="<%=request.getContextPath()%>/images/yuna.jpg" width="40px" height="40px" class="circle li_student_img" /> Ashley Smith</a></li></ul>'
				$('#staffContacts-slider_ul').append('<li id="' + String.fromCharCode(i).toLowerCase() + '" class="title"><a name="' + String.fromCharCode(i).toLowerCase() + '" class="title">' + String.fromCharCode(i).toLowerCase() + '</a>' + largeHtml + '</li>');
			} else {
				$('#staffContacts-slider_ul').append('<li id="' + String.fromCharCode(i).toLowerCase() + '" class="title"><a name="' + String.fromCharCode(i).toLowerCase() + '" class="title">' + String.fromCharCode(i).toLowerCase() + '</a><ul><li></li></ul></li>');
			}
		}
	}
	
	function loadOthers(){
		document.getElementById('searchPeopleInputLabel').innerText = 'Search Others';
		console.log("Loading Staff");
		Materialize.fadeInImage('#otherContactsSlider');
		$('#otherContactsSlider').css('display', 'block');
		$('#staffContactsSlider').css('display', 'none');
		$('#studentContactsSlider').css('display', 'none');
		$('#parentContactsSlider').css('display', 'none');
		for (var i = 65; i <= 90; i++) {
			if(String.fromCharCode(i).toLowerCase()==("j")){
				var largeHtml = '<ul><li><a href="javascript:void(0)" onclick="selectOthers()"> <img src="<%=request.getContextPath()%>/images/yuna.jpg" width="40px" height="40px" class="circle li_student_img" /> Jeniffer Smith</a></li></ul>'
				$('#otherContacts-slider_ul').append('<li id="' + String.fromCharCode(i).toLowerCase() + '" class="title"><a name="' + String.fromCharCode(i).toLowerCase() + '" class="title">' + String.fromCharCode(i).toLowerCase() + '</a>' + largeHtml + '</li>');
			} else if (String.fromCharCode(i).toLowerCase()==("a")){
				var largeHtml = '<ul><li><a href="javascript:void(0)" onclick="selectOthers()"> <img src="<%=request.getContextPath()%>/images/yuna.jpg" width="40px" height="40px" class="circle li_student_img" /> Ashley Smith</a></li></ul>'
				$('#otherContacts-slider_ul').append('<li id="' + String.fromCharCode(i).toLowerCase() + '" class="title"><a name="' + String.fromCharCode(i).toLowerCase() + '" class="title">' + String.fromCharCode(i).toLowerCase() + '</a>' + largeHtml + '</li>');
			} else {
				$('#otherContacts-slider_ul').append('<li id="' + String.fromCharCode(i).toLowerCase() + '" class="title"><a name="' + String.fromCharCode(i).toLowerCase() + '" class="title">' + String.fromCharCode(i).toLowerCase() + '</a><ul><li></li></ul></li>');
			}
		}
	}
	
	$scope.selectStudent = function (student){
		$log.log('Student Info ', student)
		$scope.studentInfo = student;
		Materialize.fadeInImage('#studentInfoDiv');
		$('#studentDashboardDiv').css('display', 'none');
		$('#studentInfoDiv').css('display', 'block');
	}
	
	$scope.selectParent = function(parent){
		$log.log('Parent Info ', parent)
		$scope.parentInfo = parent;
		Materialize.fadeInImage('#parentInfoDiv');
		$('#parentDashboardDiv').css('display', 'none');
		$('#parentInfoDiv').css('display', 'block');
	}
	
	function selectStaff(){
		Materialize.fadeInImage('#staffInfoDiv');
		$('#staffDashboardDiv').css('display', 'none');
		$('#staffInfoDiv').css('display', 'block');
	}
	
	/* function selectOthers(){
		Materialize.fadeInImage('#othersInfoDiv');
		$('#staffDashboardDiv').css('display', 'none');
		$('#staffInfoDiv').css('display', 'block');
	} */
	
	function loadAllSliderNavs(){
		$('#studentContactsSlider').sliderNav();
		$('#parentContactsSlider').sliderNav();
		$('#staffContactsSlider').sliderNav();
		$('#otherContactsSlider').sliderNav();
	}
	
	$scope.studentInfo= function(student){
		console.log("Test ", student);
	}
	
	function getStudentList(){
		var studentsObj = {
			orgId : "1"
		};
		$http.post('./listStudent', studentsObj)
		.success(function(response) {
	        $log.log("List Student Success ", response);
	        $scope.students = response.studentList;  
	        $scope.test = [];
	        $scope.studentAllLetters = [];
	        var groupedStudents = _.groupBy($scope.students, function(student){ 
			    return student.name.toUpperCase().substr(0,1); 
			});
			$log.log("All ", groupedStudents);
			_.each(groupedStudents, function (students, key) {
				var keyName = key;
				$scope[keyName] = [];
			    console.log("Index Letter ", key); // writes the Index letter

			    // optional sort
			    var sortedStudents = _.sortBy(students, function (student) {
			         return student.name.toLowerCase();
			     });

			     _.each(sortedStudents, function(student) {
			         // Writes the contact name
			         console.log(student); 
			         $scope[keyName].push(student);
			     });
			     $scope.studentAllLetters[key]= $scope[keyName];
			});
			$log.log("All Student Letters ", $scope.studentAllLetters);
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	function getParentList(){
		var studentsObj = {
			orgId : "1"
		};
		$http.post('./listStudent', studentsObj)
		.success(function(response) {
	        $log.log("List Student Success ", response);
	        $scope.parents = response.studentList;  
	        $scope.test = [];
	        $scope.parentAllLetters = [];
	        var groupedParents = _.groupBy($scope.parents, function(parent){ 
			    return parent.name.toUpperCase().substr(0,1); 
			});
			$log.log("All ", groupedParents);
			_.each(groupedParents, function (parents, key) {
				var keyName = key;
				$scope[keyName] = [];
			    console.log("Index Letter ", key); // writes the Index letter

			    // optional sort
			    var sortedParents = _.sortBy(parents, function (parent) {
			         return parent.name.toLowerCase();
			     });

			     _.each(sortedParents, function(parent) {
			         // Writes the contact name
			         console.log(parent); 
			         $scope[keyName].push(parent);
			     });
			     $scope.parentAllLetters[key]= $scope[keyName];
			});
			$log.log("All Parent Letters ", $scope.parentAllLetters);
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
} ])

.controller("calendarController", [ '$scope', '$http', '$log', '$timeout', 'store', '$rootScope', '$filter', function($scope, $http, $log, $timeout, store, $rootScope, $filter) {
//	$scope.calendarEvents = [ {
//		title : 'All Day Event',
//		start : '2016-09-01',
//		description : 'All Day event description'
//	}, {
//		title : 'Long Event',
//		start : '2016-09-07',
//		end : '2016-09-10'
//	}, {
//		id : 999,
//		title : 'Repeating Event',
//		start : '2016-09-09T16:00:00'
//	}, {
//		id : 999,
//		title : 'Repeating Event',
//		start : '2016-09-16T16:00:00'
//	}, {
//		title : 'Conference',
//		start : '2016-09-11',
//		end : '2016-09-13'
//	}, {
//		title : 'Meeting',
//		start : '2016-09-12T10:30:00',
//		end : '2016-09-12T12:30:00'
//	}, {
//		title : 'Lunch',
//		start : '2016-09-12T12:00:00'
//	}, {
//		title : 'Meeting',
//		start : '2016-09-12T14:30:00'
//	}, {
//		title : 'Happy Hour',
//		start : '2016-09-12T17:30:00'
//	}, {
//		title : 'Dinner',
//		start : '2016-09-12T20:00:00'
//	}, {
//		title : 'Birthday Party',
//		start : '2016-09-13T07:00:00',
//		activityId : "1",
//		mealId : "2"
//	}, {
//		title : 'Click for Google',
//		url : 'http://google.com/',
//		start : '2016-09-28'
//	} ];
	
	getCalendarList();
	getCalendarActivitiesList();
	getCalendarMealsList();
	getCalendarRoomsList();
	$scope.event = {};
	$scope.event.monday = false;
	$scope.event.tuesday = false;
	$scope.event.wednesday = false;
	$scope.event.thursday = false;
	$scope.event.friday = false;
	$scope.event.saturday = false;
	$scope.event.sunday = false;
	$scope.calendarEvents = [];
	
	$scope.createCalendar = function(){
		var createCalendarObj = {
			orgId: "1",
			calendarName : $scope.calendarName,
			contactEmail : "max@max.io"
		}
		
		$log.log("Create Calendar Obj", createCalendarObj);
		$http.post('./c_calendar', createCalendarObj)
		.success(function(response) {
	        $log.log("Create Calendar Success ", response);
	        $scope.calendarName = '';
	        getCalendarList();
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });
	}
	
	$scope.createEvent = function(){
		var startTime = $filter('date')($scope.event.selectedStartDate, 'yyyy-MM-dd HH') + " " + $filter('date')($scope.event.selectedStartTime, 'HH:mm');
		var endTime = $filter('date')($scope.event.selectedEndDate, 'yyyy-MM-dd') + " " + $filter('date')($scope.event.selectedEndTime, 'HH:mm');
		
		if ($scope.event.mealId == undefined)
		{
			var mealId = '';
		}
		else
		{
			var mealId = $scope.event.mealId.toString();
		}
		
		if ($scope.event.activityId == undefined)
		{
			var activityId = '';
		}
		else
		{
			var activityId = $scope.event.activityId.toString();
		}
		
		var createEventObj = {
			orgId : "1",
			calendarId : $scope.calendarId.toString(),
			eventName : $scope.event.eventName,
			activityId : activityId,
			roomId : $scope.event.roomId.toString(),
			mealId : mealId,
			mondayRepeat : $scope.event.monday,
			tuesdayRepeat : $scope.event.tuesday,
			wednesdayRepeat : $scope.event.wednesday,
			thursdayRepeat : $scope.event.thursday,
			fridayRepeat : $scope.event.friday,
			saturdayRepeat : $scope.event.saturday,
			sundayRepeat : $scope.event.sunday,
			startTime : startTime,
			endTime : endTime,
			teachers : [],
			contactEmail : "abc@gmail.com"
		}
		
		$log.log("Create Event Obj", createEventObj);
		$http.post('./c_event', createEventObj)
		.success(function(response) {
	        $log.log("Create Event Success ", response);
	        $scope.calendarName = '';
	        $scope.calendarId = '';
	        getCalendarList();
	        $scope.event = {};
	    	$scope.event.monday = false;
	    	$scope.event.tuesday = false;
	    	$scope.event.wednesday = false;
	    	$scope.event.thursday = false;
	    	$scope.event.friday = false;
	    	$scope.event.saturday = false;
	    	$scope.event.sunday = false;
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });
	}
	
	function eventTrigger(ev) {
		console.log('Event trigged: ' + ev._id);
		$('#emTitle').attr('value', ev.title + ev.description);
		//$('#emStartTime').attr('value', ev.start._i);
		$('#eventModal').openModal();
		initiateEventTimePicker();

	}
	
	$scope.dayEventTrigger = function(date) {
		var modalContent = $('.createEventModalContent');
		/* modalContent.empty();
		modalContent.append('Success'); */
		$scope.event.selectedStartDate = date.format();
		$scope.event.selectedEndDate = date.format();
		$scope.event.selectedStartTime = date.format('HH:mm');
		$scope.event.selectedEndTime = date.format('HH:mm');
		$('#createEventModal').openModal();
		$(document).ready(function() {
		    $('select').material_select();
		});
		initiateCreateEventTimePicker();
		console.log(new Date());
	}
	
	$scope.getCalendarId = function(index){
		$scope.calendar = $scope.calendars[index];
		$scope.calendarId = $scope.calendars[index].calendar.calendarId;
		$scope.calendarName = $scope.calendars[index].calendar.calendarName;
		$log.log("calendar ID ", $scope.calendars[index].calendar.calendarId);
	}

	function updateEvent(newTitle) {
		clickedEvent.title = newTitle;
		$('#calendar').fullCalendar('updateEvent', clickedEvent);
	}

	function initiateEventTimePicker() {
		$('.emStartTime').pickatime({
			'default' : '13:00',
			fromnow : 0, // set default time to * milliseconds from now
			donetext : 'Done', // done button text
			autoclose : true, // set am/pm button on itself
			darktheme : true
		});
		$('.emEndTime').pickatime({
			'default' : '15:00',
			fromnow : 0, // set default time to * milliseconds from now
			donetext : 'Done', // done button text
			autoclose : true, // set am/pm button on itself
			darktheme : true
		});
	}

	function initiateCreateEventTimePicker() {
		$('.cemStartTime').pickatime({
			'default' : '13:00',
			fromnow : 0, // set default time to * milliseconds from now
			donetext : 'Done', // done button text
			autoclose : true, // set am/pm button on itself
			darktheme : true
		});
		$('.cemEndTime').pickatime({
			'default' : '15:00',
			fromnow : 0, // set default time to * milliseconds from now
			donetext : 'Done', // done button text
			autoclose : true, // set am/pm button on itself
			darktheme : true
		});
	}
	$("input").prop('required', true);
	
	function getCalendarList(){
		var l_calendarObj = {
			orgId : "1"
		};
		$http.post('./l_calendar', l_calendarObj)
		.success(function(response) {
	        $log.log("Calendar List Calendar Success ", response);
	        $scope.calendars = response.list;
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	function getCalendarActivitiesList(){
		var l_calendarObj = {
			orgId : "1"
		};
		$http.post('./l_all_activity', l_calendarObj)
		.success(function(response) {
	        $log.log("Calendar Activity List Success ", response);
	        $scope.activities = response.list;
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	function getCalendarMealsList(){
		var l_calendarObj = {
			orgId : "1"
		};
		$http.post('./l_meal', l_calendarObj)
		.success(function(response) {
	        $log.log("Calendar Meal List Success ", response);
	        $scope.meals = response.list;
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	function getCalendarRoomsList(){
		var l_calendarObj = {
			orgId : "1"
		};
		$http.post('./l_room', l_calendarObj)
		.success(function(response) {
	        $log.log("Calendar Room List Success ", response);
	        $scope.rooms = response.list;
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	$scope.initializeCalendar = function(index){
		$scope.selectedCalendar = $scope.calendars[index];
		if($scope.selectedCalendar.eventList.length != 0)
		{
			angular.forEach($scope.selectedCalendar.eventList, function(event){
				var startTime = $filter('date')(event.startTime, 'yyyy-MM-dd HH:mm');
				var endTime = $filter('date')(event.endTime, 'yyyy-MM-dd HH:mm');
				if (event.mealId == undefined)
				{
					var mealId = '';
				}
				else
				{
					var mealId = event.mealId;
				}
				
				if (event.activityId == undefined)
				{
					var activityId = '';
				}
				else
				{
					var activityId = event.activity.activityId;
				}
				if (event.room.roomId == undefined)
				{
					var roomId = '';
				}
				else
				{
					var roomId = event.room.roomId;
				}
				var calendarEvent = {
					eventId : event.eventId,
					title : event.eventName,
					start : startTime,
					end : endTime,
					activityId : activityId,
					roomId : roomId,
					calendarId : event.calendar.calendarId,
					contactEmail : event.createdBy,
					mondayRepeat : event.mondayRepeat,
					tuesdayRepeat : event.tuesdayRepeat,
					wednesdayRepeat : event.wednesdayRepeat,
					thursdayRepeat : event.thursdayRepeat,
					fridayRepeat : event.fridayRepeat,
					saturdayRepeat : event.saturdayRepeat,
					sundayRepeat : event.sundayRepeat,
					mealId : mealId,
					teachers : []				
				}
				$scope.calendarEvents.push(calendarEvent);
			});
			$log.log("Calendar Events ", $scope.calendarEvents);
		}
		$(document).ready(function(){
			$('#calendar_'+index).fullCalendar({
				header : {
					left : 'prev,next today',
					center : 'title',
					right : 'month, agendaWeek, agendaDay, listWeek'
				},
				defaultView: 'agendaWeek',
				locale : 'en',
				weekNumberCalculation : 'local',
				defaultDate : '2016-10-17',
				navLinks : true,
				editable : true,
				eventLimit : true, // allow "more" link when too many events
				events : $scope.calendarEvents,
				eventClick : function(clickedEvent) {
					console.log(clickedEvent);
		
					//Empty the Div
					//$('#eventModalContent').empty();
		
					//Add content to Div
					//$('#eventModalContent').append('<p>' + clickedEvent._id + '</p>');
		
					//Initialize and open modal
		
					//$('.eventModal').openModal();
		
					eventTrigger(clickedEvent);
		
				},
				dayClick : function(date, view) {
					console.log(date);
					console.log(event);
					console.log(view.name);
					$scope.dayEventTrigger(date);
				},
				eventDrop: function(event, delta, revertFunc) {
		
			        console.log("event ", event);
			        console.log("event moved to ",  event.start.format());
			        console.log("event delta ", delta);
		
			       /*  if (allDay) {
			            alert("Event is now all-day");
			        }else{
			            alert("Event has a time-of-day");
			        } */
		
			        if (!confirm("Are you sure about this change?")) {
			            revertFunc();
			        }
		
			    }
			/* eventMouseover: function(eventL){
				console.log(eventL._id);
				$(this).tooltip({
					delay: 50,
					tooltip: "Test"
				})
			},
			eventMouseout: function(eventS){
				$(this).tooltip('remove');
			} */
			});
			$log.log("Calendar Render "+index);
		  });
	}
} ])

.controller("enrollmentController", [ '$scope', '$http', '$log', '$timeout', 'store', '$rootScope', function($scope, $http, $log, $timeout, store, $rootScope) {
	
	getSchoolList();
	getProgramsList();
	getCalendarList();
	getEnrollmentsList();
	getStudentList();
	
	$scope.createEnrollment = function(){
		var createEnrollmentObj = {
			enrollmentName : $scope.enrollmentName,
			programId : $scope.programId.toString(),
			schoolId : $scope.schoolId.toString(),
			calendarId : $scope.calendarId.toString(),
			contactEmail : "max@max.io"
		}
		$log.log("Create Enrollment Obj", createEnrollmentObj);
		$http.post('./c_enrollment', createEnrollmentObj)
		.success(function(response) {
	        $log.log("Create Enrollment Success ", response);
	        $scope.enrollmentName = '';
	        $scope.schoolId = '';
	        $scope.programId = '';
	        $scope.calendarId = '';
	        $(document).ready(function() {
			    $('select').material_select();
			});
	        getEnrollmentsList();
	        getCalendarList();
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });
	}
	
	$scope.createEnrollmentStudent = function(){
		var createEnrollmentStudentObj = {
			enrollmentId : $scope.enrollmentId.toString(),
			studentId : $scope.selectedStudentId.toString(),
			contactEmail : "max@max.io"
		}
		$log.log("Create Enrollment Student Obj", createEnrollmentStudentObj);
		$http.post('./c_enrollmentStudent', createEnrollmentStudentObj)
		.success(function(response) {
	        $log.log("Create Enrollment Student Success ", response);
	        $scope.searchParams = '';
	        $scope.enrollmentId = '';
	        $(document).ready(function() {
			    $('select').material_select();
			});
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });
	}
	
	$scope.selectStudent = function(student){
		$log.log("Selected Student ", student);
		$scope.searchParams = student.name;
		$scope.hideAutocompleteList();
		$scope.selectedStudentId = student.studentId;
	}
	
	$scope.hideAutocompleteList = function(){
        $scope.showResults = false;
    }
	    
    $scope.showAutocompleteList = function(){
        $scope.showResults = true;
    }

	
	function getEnrollmentsList(){
		var enrollmentObj = {
			orgId : "1"
		};
		$http.post('./l_enrollment', enrollmentObj)
		.success(function(response) {
	        $log.log("List Enrollment Success ", response);
	        $scope.enrollments = response.list;   
	        $(document).ready(function() {
			    Materialize.updateTextFields();
			});
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	function getSchoolList(){
		$scope.l_schoolObj = {
			orgId : "1"
		};
		$http.post('./l_school', $scope.l_schoolObj)
		.success(function(response) {
	        $log.log("Success ", response);
	        $scope.schools = response.list;
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	function getProgramsList(){
		var programsObj = {
			orgId : "1"
		};
		$http.post('./l_program', programsObj)
		.success(function(response) {
	        $log.log("Programs Success ", response);
	        $scope.programs = response.list;      
	        $(document).ready(function() {
			    Materialize.updateTextFields();
			});
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	function getCalendarList(){
		$scope.l_calendarObj = {
			orgId : "1"
		};
		$http.post('./l_clean_calendar', $scope.l_calendarObj)
		.success(function(response) {
	        $log.log("Clean Calendar Success ", response);
	        $scope.calendars = response.list;
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
	
	function getStudentList(){
		var studentsObj = {
			orgId : "1"
		};
		$http.post('./listStudent', studentsObj)
		.success(function(response) {
	        $log.log("Enrollment List Student Success ", response);
	        $scope.students = response.studentList;  
//	        $('input.autocomplete').autocomplete({
//	        	data: {
//				  "Apple": null,
//				  "Microsoft": null,
//				  "Google": 'http://placehold.it/250x250'
//				}
//			});
	    }, function(err) {
	        //fail case
	        $log.log("Error ", err);
	    });	
	}
} ]);

toddlytic.config(function ($httpProvider) {
	$httpProvider.defaults.headers.post["Content-Type"] = "application/json";
});

//toddlytic.directive('addInput', ['$compile', function ($compile) { // inject $compile service as dependency
//    return {
//        restrict: 'A',
//        link: function (scope, element, attrs) {
//            // click on the button to add new input field
//            element.find('button').bind('click', function () {
//                // I'm using Angular syntax. Using jQuery will have the same effect
//                // Create input element
//                var input = angular.element('<div id="recipeDiv_'+scope.inputCounter+'" class="row"><div class="col s5 input-field"><input ng-model="recipeInfo['+scope.inputCounter+']" type="text" class="validate col s9" id="recipeItem_'+scope.inputCounter+'"/> <label for="recipeItem_'+scope.inputCounter+'">Recipe</label><img class="activityModalsDeleteButton" ng-click="deleteRecipeItemEntryRow('+scope.inputCounter+')" src="./images/remove.png" width="30px" height="30px" /></div></div>');
//                // Compile the HTML and assign to scope
//                var compile = $compile(input)(scope);
//
//                // Append input to div
//               $('#recipeDiv').append(input);
//
//                // Increment the counter for the next input to be added
//                scope.inputCounter++;
//            });
//        }
//    }
//}]);

toddlytic.directive('emptyInput', function ($parse) {
    return {
        require: '?ngModel',
        link: function (scope, element, attrs, ngModel) {
            var ngModelGet = $parse(attrs.ngModel);
            scope.$watch(attrs.ngModel, function () {
                if (ngModelGet(scope) == undefined && angular.isObject(ngModel) && (!attrs.type || attrs.type === 'text' || attrs.type === 'number' || attrs.type === 'email')) {
                    var model = $parse(attrs.ngModel);
                    model.assign(scope, '');
                }
            });
        }
    }
});

toddlytic.filter("myFilter", function($rootScope, $window, $log){
    return function(input, searchText){
        if(searchText == null || searchText == undefined || searchText == '')
        {
//            $rootScope.gotSearchResults = false;
//            $log.debug('searchText Test', searchText);
        }
        else
        {
            var returnArray = [];
            $log.debug('searchText', searchText);
            var searchTextSplit = searchText.toLowerCase().split(' ');
            for(var x = 0; x < input.length; x++){
                var count = 0;
                for(var y = 0; y < searchTextSplit.length; y++){
                    if(input[x].name.toLowerCase().indexOf(searchTextSplit[y]) !== -1){
                        count++;
                    }
                }
                if(count == searchTextSplit.length){
                	returnArray.push(input[x]);
                }
            }
            $log.debug('returnArray', returnArray);
            $rootScope.localReturnArray = returnArray;
            return returnArray;
        }
    }
});

toddlytic.directive('date', function (dateFilter) {
    return {
        require:'ngModel',
        link:function (scope, elm, attrs, ctrl) {

            var dateFormat = attrs['date'] || 'yyyy-MM-dd';
           
            ctrl.$formatters.unshift(function (modelValue) {
                return dateFilter(modelValue, dateFormat);
            });
        }
    };
})