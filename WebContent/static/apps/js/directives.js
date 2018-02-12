/***
GLobal Directives
***/

// Route State Load Spinner(used on page or content load)
MetronicApp.directive('ngSpinnerBar', ['$rootScope', '$state',
    function($rootScope, $state) {
        return {
            link: function(scope, element, attrs) {
                // by defult hide the spinner bar
                element.addClass('hide'); // hide spinner bar by default

                // display the spinner bar whenever the route changes(the content part started loading)
                $rootScope.$on('$stateChangeStart', function() {
                    element.removeClass('hide'); // show spinner bar
                });

                // hide the spinner bar on rounte change success(after the content loaded)
                $rootScope.$on('$stateChangeSuccess', function() {
                    element.addClass('hide'); // hide spinner bar
                    $('body').removeClass('page-on-load'); // remove page loading indicator
                    Layout.setAngularJsSidebarMenuActiveLink('match', null, $state); // activate selected link in the sidebar menu
                   
                    // auto scorll to page top
                    setTimeout(function () {
                        App.scrollTop(); // scroll to the top on content load
                    }, $rootScope.settings.layout.pageAutoScrollOnLoad);     
                });

                // handle errors
                $rootScope.$on('$stateNotFound', function() {
                    element.addClass('hide'); // hide spinner bar
                });

                // handle errors
                $rootScope.$on('$stateChangeError', function() {
                    element.addClass('hide'); // hide spinner bar
                });
            }
        };
    }
])

// Handle global LINK click
MetronicApp.directive('a', function() {
    return {
        restrict: 'E',
        link: function(scope, elem, attrs) {
            if (attrs.ngClick || attrs.href === '' || attrs.href === '#') {
                elem.on('click', function(e) {
                    e.preventDefault(); // prevent link click for above criteria
                });
            }
        }
    };
});

// Handle Dropdown Hover Plugin Integration
MetronicApp.directive('dropdownMenuHover', function () {
  return {
    link: function (scope, elem) {
      elem.dropdownHover();
    }
  };  
});

MetronicApp.directive('emptyInput', function ($parse) {
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

MetronicApp.filter("myFilter", function($rootScope, $window, $log){
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

MetronicApp.filter("myFilterStudents", function($rootScope, $window, $log){
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
                    if(input[x].student.name.toLowerCase().indexOf(searchTextSplit[y]) !== -1){
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

MetronicApp.directive('date', function (dateFilter) {
    return {
        require:'ngModel',
        link:function (scope, elm, attrs, ctrl) {

            var dateFormat = attrs['date'] || 'yyyy-MM-dd';
           
            ctrl.$formatters.unshift(function (modelValue) {
                return dateFilter(modelValue, dateFormat);
            });
        }
    };
});

MetronicApp.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;
            
            element.bind('change', function(){
                scope.$apply(function(){
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);

MetronicApp.filter('currentUserToTop', function () {
    return function (users, current) {
        var newList = [];
        angular.forEach(users, function (u) {
            if (u.contactId == current) {
                newList.unshift(u);
            }
            else {
                newList.push(u);
            }
        });
        return newList;
    };
});

MetronicApp.directive('decimalPlaces',function(){
    return {
        link:function(scope,ele,attrs){
            ele.bind('keypress',function(e){
                var newVal=$(this).val()+(e.charCode!==0?String.fromCharCode(e.charCode):'');
                if($(this).val().search(/(.*)\.[0-9][0-9]/)===0 && newVal.length>$(this).val().length){
                    e.preventDefault();
                }
            });
        }
    };
});

MetronicApp.directive('numberOnlyInput', function () {
    return {
        restrict: 'EA',
        template: '<input decimal-places name="packagePrice" ng-model="inputValue" class="col-xs-6 col-sm-6 col-md-12 col-lg-12 infoInput form-control" style="border-radius:0px!important;border-top-right-radius:10px!important;border-bottom-right-radius:10px!important"/>',
        scope: {
            inputValue: '=',
        },
        link: function (scope) {
            scope.$watch('inputValue', function(newValue,oldValue) {
                var arr = String(newValue).split("");
                if (arr.length === 0) return;
                if (arr.length === 1 && (arr[0] == '-' || arr[0] === '.' )) return;
                if (arr.length === 2 && newValue === '-.') return;
                if (isNaN(newValue)) {
                    scope.inputValue = oldValue;
                }
            });
        }
    };
});

//MetronicApp.directive('select', function() {
//  return {
//    restrict: 'E',
//    require: '?ngModel',
//    link: function(scope, element, attr, ngModelCtrl) {
//      if (ngModelCtrl && attr.multiple) {
//        ngModelCtrl.$isEmpty = function(value) {
//          return !value || value.length === 0;
//        }
//      }
//    }
//  }
//});