angular.module("templates", []).run(["$templateCache", function($templateCache) {$templateCache.put("/templates/about.html","<ion-view title=\"About this Application\"><ion-content has-header=\"true\" has-tabs=\"true\" padding=\"true\"><div class=\"card\"><p>This is a sample Vehicle managment project create for manage vehicle.</p></div></ion-content></ion-view>");
$templateCache.put("/templates/home.html","<ion-view title=\"Add vehicle\"><ion-content has-header=\"true\" has-tabs=\"true\"><div class=\"card\"><div class=\"item item-text-wrap\"><h2>Add Vehicle Here</h2></div></div><div class=\"list\"><div class=\"item item-input\"><input type=\"text\" placeholder=\"Please\" ng-model=\"vehicle.name\"/></div></div><div class=\"list item item-input item-select\"><div class=\"input-label\"><label>Type</label><select ng-model=\"vehicle.type\"><option>sedan</option><option>toyota</option><option>XLI</option></select></div></div><div class=\"row\"><div class=\"col\"><label>Upload image</label><input type=\"file\" ng-model=\"vehicle.image\" base-sixty-four-input=\"base-sixty-four-input\" class=\"button button-block\"/></div></div><div class=\"row\"><div class=\"col\"><button ng-click=\"addVehicle()\" id=\"save\" class=\"button button-block\">Save</button></div></div><div class=\"row\"><div class=\"col\"><button ng-click=\"uploadImage()\" class=\"button button-block\">upload Image mobile</button></div></div></ion-content></ion-view>");
$templateCache.put("/templates/tabs.html","<!--Create tabs with an icon and label, using the tabs-positive style.\nEach tab\'s child <ion-nav-view> directive will have its own\nnavigation history that also transitions its views in and out.--><ion-tabs tabs-style=\"tabs-icon-top\" tabs-type=\"tabs-default\" class=\"tabs-icon-top tabs-positive\"><!-- Home Tab--><ion-tab title=\"Add Vehicle\" icon=\"icon ion-plus\" href=\"#/tab/home\" id=\"home\"><ion-nav-view name=\"home-tab\"></ion-nav-view></ion-tab><!-- Vendors Tab--><ion-tab title=\"List Of Vehicle\" icon=\"icon ion-search\" href=\"#/tab/vendors\" id=\"vehicleList\"><ion-nav-view name=\"vendors-tab\"></ion-nav-view></ion-tab><!-- About Tab--><ion-tab title=\"About\" icon=\"icon ion-information-circled\" href=\"#/tab/about\"><ion-nav-view name=\"about-tab\"></ion-nav-view></ion-tab></ion-tabs>");
$templateCache.put("/templates/vendors.html","<ion-view title=\"List of Vehicle\"><ion-content has-header=\"true\" has-tabs=\"true\" padding=\"true\"><input type=\"text\" ng-model=\"searchVehicle\" placeholder=\"Search Vehicle here\"/><div ng-repeat=\"vendor in vehicles | filter:searchVehicle\" class=\"list\"><a href=\"{{vendor.link}}\" target=\"_blank\" class=\"item item-thumbnail-left\"><img src=\"data:image/gif;base64,{{vendor.image.base64}}\"/><h2>{{vendor.name}}</h2><p>{{vendor.type}}</p></a></div></ion-content></ion-view>");}]);