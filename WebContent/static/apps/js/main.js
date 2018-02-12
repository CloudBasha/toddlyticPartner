/***
Metronic AngularJS App Main Script
***/

/* Metronic App */
var MetronicApp = angular.module("MetronicApp", [
    "ui.router", 
    "ui.bootstrap", 
    "oc.lazyLoad",  
    "ngSanitize",
    'angular-storage',
    'ng.deviceDetector',
    'ngMessages',
    'frapontillo.bootstrap-switch',
//    'ngRoute',
    'permission',
    'permission.ui',
    'timer',
    'datatables',
    'isoCurrency',
    'angularTreeview',
    'angular-timezone-selector'
//    'ngAnimate'
]); 

/* Configure ocLazyLoader(refer: https://github.com/ocombe/ocLazyLoad) */
MetronicApp.config(['$ocLazyLoadProvider', function($ocLazyLoadProvider) {
    $ocLazyLoadProvider.config({
        // global configs go here
    });
}]);

//AngularJS v1.3.x workaround for old style controller declarition in HTML
MetronicApp.config(['$controllerProvider', function($controllerProvider) {
  // this option might be handy for migrating old static/apps, but please don't use it
  // in new ones!
  $controllerProvider.allowGlobals();
}]);

/********************************************
 END: BREAKING CHANGE in AngularJS v1.3.x:
*********************************************/

/* Setup global settings */
MetronicApp.factory('settings', ['$rootScope', function($rootScope) {
    // supported languages
    var settings = {
        layout: {
            pageSidebarClosed: false, // sidebar menu state
            pageContentWhite: true, // set page content layout
            pageBodySolid: false, // solid body color state
            pageAutoScrollOnLoad: 1000 // auto scroll to top on page load
        },
        staticPath: 'assets',
        globalPath: 'assets/global',
        layoutPath: 'assets/layouts/layout2',
    };

    $rootScope.settings = settings;

    return settings;
}]);

/* Setup App Main Controller */
MetronicApp.controller('AppController', function($scope, $rootScope, $http, $log, $state, store, $location) {
    $scope.$on('$viewContentLoaded', function() {    	
    	$rootScope.baseUrl = ".";
    	$rootScope.loggedIn = store.get('loggedIn');
    	var loginInfo = store.get('loginInfo');
    	var profilePicUrl = store.get('profilePicUrl');
    	
    	if(profilePicUrl != undefined){
    		$rootScope.profilePicUrl = profilePicUrl;
    	}
    	
    	if(loginInfo != undefined){
    		$rootScope.orgId = loginInfo.orgId;
    		$rootScope.contactEmail = loginInfo.email;
    		$rootScope.contactId = loginInfo.contactId;
			$rootScope.userName = loginInfo.name;
			$scope.loggedIn = true;
    	}
    	else{
    		console.log($state.current);
    		if($state.current.name === 'login') {
     			$scope.enterprise = false;
     			$scope.loggedIn = false;
     		}
    		if($state.current.name.includes('enterprise_')) {
    			$scope.enterprise = true;
    			$scope.loggedIn = false;
    		}
    		else if($state.current.name !== 'registrationActivation') {
            	$state.go('login');    			
    		}
    	}
//    	$log.debug("STATE ", $state);
    	if($state.current.name == 'login'){
    		 $.backstretch([
		        "assets/pages/media/bg/1.jpg",
		        "assets/pages/media/bg/2.jpg",
		        "assets/pages/media/bg/3.jpg",
		        "assets/pages/media/bg/4.jpg"
		        ], {
		          fade: 1000,
		          duration: 8000
		    	}
    		);
    	}
    	else{
    		$.backstretch('destroy');
    	}

//		$scope.loggedIn = true;
        //App.initComponents(); // init core components
        //Layout.init(); //  Init entire layout(header, footer, sidebar, etc) on page load if the partials included in server side instead of loading with ng-include directive
    });
});



/***
Layout Partials.
By default the partials are loaded through AngularJS ng-include directive. In case they loaded in server side(e.g: PHP include function) then below partial 
initialization can be disabled and Layout.init() should be called on page load complete as explained above.
***/

/* Setup Layout Part - Header */
MetronicApp.controller('HeaderController', function($scope, $state, store, $http, $timeout, $rootScope, PermRoleStore, $log) {
    $scope.$on('$includeContentLoaded', function() {
    	$scope.logout = function(){
    		$('#logoutConfirmModal').modal('show');
//    		swal({
//        	  title: "Are you sure you want to logout?",
//        	  type: "warning",
//        	  showCancelButton: true,
//        	  confirmButtonText: "Yes",
//        	  cancelButtonText: "No",
//        	  confirmButtonColor: '#3085d6',
//        	  cancelButtonColor: '#d33',
//        	  confirmButtonClass: 'btn btn-success',
//        	  cancelButtonClass: 'btn btn-danger'
//        	}).then(function () {
//        		store.set('loggedIn', false);
//        		store.remove('loginInfo')
//        		$http.get('./logout')
//    			.success(function(response) {
//    				swal({title : "Logged out!", text : "You have been logged out.", type : "success", timer:1900});
//    				$timeout(function(){
//        				PermRoleStore.clearStore();
//        				$state.go('login');
//        				$rootScope.role = '';
//    				}, 2000);
//    		    }, function(err) {
//    		        //fail case
//    		        $log.debug("Error ", err);
//    		    });
//			}, function (dismiss) {
//			  if (dismiss === 'cancel') {
//			    
//			  }
//			});
    	}
    	
    	$rootScope.doLogout = function(){
    		$('#logoutConfirmModal').modal('hide');
    		$log.debug("Doing Log out");
    		store.set('loggedIn', false);
    		store.remove('loginInfo')
    		store.remove('profilePicUrl');
    		$rootScope.profilePicUrl = null;
			$state.go('login');
//    		$http.get('./logout')
//			.success(function(response) {
//				$timeout(function(){
//    				PermRoleStore.clearStore();
//    				$state.go('login');
//    				$rootScope.role = '';
//				}, 1000);
//		    }, function(err) {
//		        //fail case
//		        $log.debug("Error ", err);
//		    });
    	}
        Layout.initHeader(); // init header
    });
});

/* Setup Layout Part - Sidebar */
MetronicApp.controller('SidebarController', ['$state', '$scope', function($state, $scope) {
    $scope.$on('$includeContentLoaded', function() {
        Layout.initSidebar($state); // init sidebar
//        if($state.current.name.includes('enterprise_')) {
//			$scope.enterprise = true;
//			$scope.loggedIn = false;
//		}
        $scope.openModal = function(value){
        	if(value == 'addProgram'){
        		$state.go('programs', {shortCut : value});
        	}
        	else if(value == 'addAction'){
        		$state.go('actions', {shortCut : value});
        	}
        	else{
        		$state.go('people', {shortCut : value});
        	}
        }
    });
}]);

/* Setup Layout Part - Quick Sidebar */
MetronicApp.controller('QuickSidebarController', ['$scope', function($scope) {
    $scope.$on('$includeContentLoaded', function() {
       setTimeout(function(){
            QuickSidebar.init(); // init quick sidebar
        }, 2000)
    });
}]);

/* Setup Layout Part - Theme Panel */
MetronicApp.controller('ThemePanelController', ['$scope', function($scope) {
    $scope.$on('$includeContentLoaded', function() {
        Demo.init(); // init theme panel
    });
}]);

/* Setup Layout Part - Footer */
MetronicApp.controller('FooterController', ['$scope', function($scope) {
    $scope.$on('$includeContentLoaded', function() {
        Layout.initFooter(); // init footer
    });
}]);

/* Setup Routing For All Pages */
MetronicApp.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
    // Redirect any unmatched url
    $urlRouterProvider.otherwise("/login.html");

    $stateProvider
    
	    .state('forgotPassword', {
	        url: "/forgotPassword.html?token=",
	        data: {pageTitle: 'Toddlytic Partner'},
    		views: {
	    		"notLoggedIn": {
			        templateUrl: "static/apps/views/resetPassword.html",
			        controller: "ResetPasswordController",
			        resolve: {
			            deps: ['$ocLazyLoad', function($ocLazyLoad) {
			                return $ocLazyLoad.load({
			                    name: 'MetronicApp',
			                    insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
			                    files: [
			                        'static/apps/js/controllers/ResetPasswordController.js',
			                    ] 
			                });
			            }]
			        }
	    		}
    		}
	    })
    	.state('login', {
		        url: "/login.html",
		        data: {pageTitle: 'Toddlytic Partner'},
	    		views: {
	    		"notLoggedIn": {
	    			templateUrl: "static/apps/views/login.html",
			        controller: "LoginController",
			        resolve: {
			            deps: ['$ocLazyLoad', function($ocLazyLoad) {
			                return $ocLazyLoad.load({
			                    name: 'MetronicApp',
			                    insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
			                    files: [
			                        'static/apps/js/controllers/LoginController.js',
			                    ] 
			                });
			            }]
			        }
	    		}
    		}
	    })
	    
	    .state('organizations', {
            url: "/organizations.html",
            templateUrl: "static/apps/views/organizations.html",            
            data: {pageTitle: 'Toddlytic Partner'},
            controller: "OrganizationsController",
            params: {
            	partnerId: ''
            },
            resolve: {
                deps: ['$ocLazyLoad', function($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',
                        insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                        files: [
                            'static/apps/js/controllers/OrganizationsController.js'
                        ] 
                    });
                }]
            }
        })
	    
	    .state('enterprise_organizations', {
            url: "/enterprise/organizations.html",         
            data: {pageTitle: 'Toddlytic Partner'},
            params: {
            	partnerId: ''
            },
            views: {
            	"enterprise": {
                    controller: "OrganizationsController",
                    templateUrl: "static/apps/views/organizations.html",   
                    resolve: {
                        deps: ['$ocLazyLoad', function($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                name: 'MetronicApp',
                                insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                                files: [
                                    'static/apps/js/controllers/OrganizationsController.js'
                                ] 
                            });
                        }]
                    }
            	}
            }
        })
        .state('profile', {
            url: "/profile.html",
            templateUrl: "static/apps/views/profile.html",
            data: {pageTitle: 'My Profile'},
            controller: "ProfileController",
            resolve: {
                deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',
                        insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                        files: [
                            'static/apps/js/controllers/ProfileController.js'
                        ]
                    });
                }]
            }
        })
        .state('invoiceTemplate', {
            url: "/invoiceTemplate.html",
            data: {pageTitle: 'Invoice'},
            templateUrl: "static/apps/views/invoiceTemplate.html",
            controller: "InvoiceTemplateController",
            resolve: {
                deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',
                        insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                        files: [
                            'static/apps/js/controllers/InvoiceTemplateController.js',
                        ]
                    });
                }]
            },
            params: {obj: null},
        })
        
        .state('organizationInformation', {
            url: "/organizationInformation.html",
            templateUrl: "static/apps/views/organizationInformation.html",            
            data: {pageTitle: 'Toddlytic Partner'},
            controller: "OrganizationInformationController",
            params: {obj : null, openTab : null, partner: null},
            resolve: {
                deps: ['$ocLazyLoad', function($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',
                        insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                        files: [
                            'static/apps/js/controllers/OrganizationInformationController.js'
                        ] 
                    });
                }]
            }
        })
        
        .state('enterprise_organizationInformation', {
            url: "/enterprise/organizationInformation.html",
            params: {obj : null, partner: null, openTab : null},         
            data: {pageTitle: 'Toddlytic Partner'},
            views: {
            	"enterprise": {
            		controller: "OrganizationInformationController",
                    templateUrl: "static/apps/views/organizationInformation.html",   
                    resolve: {
                        deps: ['$ocLazyLoad', function($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                name: 'MetronicApp',
                                insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                                files: [
                                    'static/apps/js/controllers/OrganizationInformationController.js'
                                ] 
                            });
                        }]
                    }
            	}
            }
            
        })
        
        .state('users', {
            url: "/users.html",
            templateUrl: "static/apps/views/users.html",            
            data: {pageTitle: 'Toddlytic Partner'},
            controller: "UserController",
            params: {obj : null, openTab : null},
            resolve: {
                deps: ['$ocLazyLoad', function($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',
                        insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                        files: [
                            'static/apps/js/controllers/userController.js'
                        ] 
                    });
                }]
            }
        })
                
        .state('registrationActivation', {
            url: "/registrationActivation.html?email=",            
            data: {pageTitle: 'Toddlytic Partner'},
            views: {
            	'notLoggedIn': {
            		templateUrl: "static/apps/views/registrationActivation.html",
                    controller: "RegistrationActivationController",
                    params: {obj : null, openTab : null},
                    resolve: {
                        deps: ['$ocLazyLoad', function($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                name: 'MetronicApp',
                                insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                                files: [
                                    'static/apps/js/controllers/RegistrationActivationController.js'
                                ] 
                            });
                        }]
                    }
            	}
            }
        })
        
        .state('organizationBilling', {
            url: "/organizationBilling.html",
            templateUrl: "static/apps/views/organizationBilling.html",            
            data: {pageTitle: 'Organization Billing'},
            controller: "OrganizationBillingController",
            resolve: {
                deps: ['$ocLazyLoad', function($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',
                        insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                        files: [
                            'static/apps/js/controllers/OrganizationBillingController.js'
                        ] 
                    });
                }]
            }
        })
        
        .state('organizationProgramBilling', {
            url: "/organizationProgramBilling.html",
            templateUrl: "static/apps/views/organizationProgramBilling.html",            
            data: {pageTitle: 'Organization Program Billing'},
            controller: "OrganizationProgramBillingController",
            params: {
            	obj: null
            },
            resolve: {
                deps: ['$ocLazyLoad', function($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',
                        insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                        files: [
                            'static/apps/js/controllers/OrganizationProgramBillingController.js'
                        ] 
                    });
                }]
            }
        })
        
        .state('orgStudentBilling', {
            url: "/orgStudentBilling.html",
            templateUrl: "static/apps/views/orgStudentBilling.html",
            data: {
                pageTitle: 'Organization Student Billing',
            },
            params : {obj : null},
            controller: "OrgStudentBillingController",
            resolve: {
                deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',
                        insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                        files: [
                            'static/apps/js/controllers/OrgStudentBillingController.js'
                        ]
                    });
                }]
            }
        })
        
        .state('myPartners', {
            url: "/myPartners.html",
            templateUrl: "static/apps/views/myPartners.html",            
            data: {pageTitle: 'My Partners'},
            controller: "MyPartnersController",
            resolve: {
                deps: ['$ocLazyLoad', function($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',
                        insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                        files: [
                            'static/apps/js/controllers/MyPartnersController.js'
                        ] 
                    });
                }]
            }
        })
        
        
        .state('enterprise_myPartners', {
            url: "/enterprise/myPartners.html",         
            data: {pageTitle: 'My Partners'},
            views: {
	    		"enterprise": {
			        templateUrl: "static/apps/views/myPartners.html",
			        controller: "MyPartnersController",
			        resolve: {
			            deps: ['$ocLazyLoad', function($ocLazyLoad) {
			                return $ocLazyLoad.load({
			                    name: 'MetronicApp',
			                    insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
			                    files: [
			                        'static/apps/js/controllers/MyPartnersController.js',
			                    ] 
			                });
			            }]
			        }
	    		}
    		}
        })
        
        .state('enterprise_listPartners', {
            url: "/enterprise/listPartners.html",            
            data: {pageTitle: 'Partners List'},
            params: {obj : null, partners: []},
            views: {
            	"enterprise": {
                    templateUrl: "static/apps/views/listPartners.html",
                    controller: "ListPartnersController",
                    resolve: {
                        deps: ['$ocLazyLoad', function($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                name: 'MetronicApp',
                                insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                                files: [
                                    'static/apps/js/controllers/ListPartnersController.js'
                                ] 
                            });
                        }]
                    }
            	}
            }
        })
        
        .state('listPartners', {
            url: "/listPartners.html",
            templateUrl: "static/apps/views/listPartners.html",            
            data: {pageTitle: 'Partners List'},
            controller: "ListPartnersController",
            params: {obj : null,
            		partners: []
            },
            resolve: {
                deps: ['$ocLazyLoad', function($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',
                        insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                        files: [
                            'static/apps/js/controllers/ListPartnersController.js'
                        ] 
                    });
                }]
            }
        })
        
        .state('partnerInformation', {
            url: "/partnerInformation.html",
            templateUrl: "static/apps/views/partnerInformation.html",            
            data: {pageTitle: 'Partner Information'},
            controller: "PartnerInformationController",
            params: {obj : null},
            resolve: {
                deps: ['$ocLazyLoad', function($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',
                        insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                        files: [
                            'static/apps/js/controllers/PartnerInformationController.js'
                        ] 
                    });
                }]
            }
        })
        
         .state('buyPurchaseInvoice', {
            url: "/buyPurchaseInvoice.html",
            templateUrl: "static/apps/views/buyPurchaseInvoice.html",
            data: {pageTitle: 'Purchase Invoice'},
            controller: "BuyPurchaseInvoiceController",
            params: {obj: null, orgId: null},
            resolve: {
                deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',
                        insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                        files: [
                            'static/apps/js/controllers/BuyPurchaseInvoiceController.js'
                        ]
                    });
                }]
            }
        })
        
        
        .state('unauthorized', {
            url: "/unauthorized.html",
            templateUrl: "static/apps/views/unauthorized.html",            
            data: {pageTitle: 'Unauthorized Page'},
            controller: "UnauthorizedController",
            resolve: {
                deps: ['$ocLazyLoad', function($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        name: 'MetronicApp',
                        insertBefore: '#ng_load_plugins_before', // load the above css files before a LINK element with this ID. Dynamic CSS files must be loaded between core and theme css files
                        files: [
                            'static/apps/js/controllers/UnauthorizedController.js'
                        ] 
                    });
                }]
            }
        })
}]);

MetronicApp.config(function(storeProvider, $logProvider) {
    // Store defaults to localStorage but we can set sessionStorage or cookieStorage.
//    $logProvider.debugEnabled(false);
    storeProvider.setStore('sessionStorage');
    toastr.options = {
	  "closeButton": true,
	  "debug": false,
	  "positionClass": "toast-bottom-center",
	  "onclick": null,
	  "showDuration": "1000",
	  "hideDuration": "1000",
	  "timeOut": "7000",
	  "extendedTimeOut": "1000",
	  "showEasing": "swing",
	  "hideEasing": "linear",
	  "showMethod": "fadeIn",
	  "hideMethod": "fadeOut"
	}
});

/* Init global settings and run the app */
MetronicApp.run(function($rootScope, settings, $state, PermRoleStore, $urlRouter, store, $log) {
	
	$rootScope.$watch('role', function() {
        $log.debug('Role Variable has changed');
//        getRolePermissions();

	    MetronicApp.value('auth', {
	        isAuthorized: true
	    });

	    $rootScope.$state = $state; // state to be accessed from view
	    $rootScope.$settings = settings; // state to be accessed from view
    });
	
	function getRolePermissions(){
		var roleObj = store.get('loginInfo');
		$log.debug("Store Obj ", roleObj);
		if(roleObj != undefined || roleObj != null){
			$rootScope.role = roleObj.role;
		}
		else{s
			$rootScope.role = ""
		}
	    $rootScope.$state = $state; // state to be accessed from view
	    $rootScope.$settings = settings; // state to be accessed from view
	    $log.debug("Role Info ", $rootScope.role);
	    PermRoleStore.defineRole($rootScope.role, ['auth', function (auth) {
	      return auth.isAuthorized;
	    }]);
	    MetronicApp.value('auth', {
	        isAuthorized: true
	    });
	    
	    $urlRouter.sync();
	//    $urlRouter.listen();
	    
	    var permissions = PermRoleStore.getStore();
	    $log.debug('permsission ', permissions);
	}
});