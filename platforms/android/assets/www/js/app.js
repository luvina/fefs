'use strict';
(function() {
  var App;

  App = angular.module('app', ['ionic', 'naif.base64']);

  App.run(function($ionicPlatform) {
    return $ionicPlatform.ready(function() {
      if (window.cordova && window.cordova.plugins.Keyboard) {
        cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      }
      if (window.StatusBar) {
        return StatusBar.styleDefault();
      }
    });
  });

  App.config(function($stateProvider, $urlRouterProvider) {
    $stateProvider.state('tab', {
      url: '/tab',
      abstract: true,
      templateUrl: 'templates/tabs.html'
    }).state('tab.home', {
      url: '/home',
      views: {
        'home-tab': {
          templateUrl: 'templates/home.html',
          controller: 'HomeCtrl'
        }
      }
    }).state('tab.vendors', {
      url: '/vendors',
      views: {
        'vendors-tab': {
          templateUrl: 'templates/vendors.html',
          controller: 'vehicleSearchList'
        }
      }
    }).state('tab.about', {
      url: '/about',
      views: {
        'about-tab': {
          templateUrl: 'templates/about.html'
        }
      }
    });
    return $urlRouterProvider.otherwise('/tab/home');
  });

}).call(this);

(function() {
  angular.module('app').factory('VehicleData', function() {
    var _vehicles;
    _vehicles = [];
    return {
      get: function() {
        return _vehicles;
      },
      set: function(vehicles) {
        _vehicles = vehicles;
      }
    };
  }).controller('vehicleSearchList', function($scope, VehicleData) {
    $scope.vehicles = VehicleData.get();
  }).controller('HomeCtrl', function($scope, VehicleData) {
    var exportDataToCSV;
    $scope.uploadImage = function() {};
    document.addEventListener('deviceready', (function() {
      var options;
      options = {
        quality: 50,
        destinationType: Camera.DestinationType.DATA_URL,
        sourceType: Camera.PictureSourceType.CAMERA,
        allowEdit: true,
        encodingType: Camera.EncodingType.JPEG,
        targetWidth: 100,
        targetHeight: 100,
        popoverOptions: CameraPopoverOptions,
        saveToPhotoAlbum: false
      };
      $cordovaCamera.getPicture(options).then((function(imageData) {
        var image;
        image = document.getElementById('myImage');
        image.src = 'data:image/jpeg;base64,' + imageData;
      }), function(err) {});
    }), false);
    $scope.vehicle = {};
    $scope.vehicles = VehicleData.get();
    $scope.addVehicle = function() {
      $scope.vehicles.push($scope.vehicle);
      VehicleData.set($scope.vehicles);

      /*pom = document.createElement('a')
      pom.setAttribute 'href', 'data:text/csv;charset=utf-8,' + encodeURIComponent(exportDataToCSV($scope.vehicles))
      pom.setAttribute 'download', 'test.csv'
      pom.click()
       */
      localStorage.setItem('vehicleName', $scope.vehicle.name);
      localStorage.setItem('vehicleType', $scope.vehicle.type);
      localStorage.setItem('vehicleImage', $scope.vehicle.image.base64);
    };

    /*It will make object for saving in csv file */
    exportDataToCSV = function(objArray) {
      var array, i, index, line, str;
      array = objArray;
      str = '';
      i = 0;
      while (i < array.length) {
        line = '';
        for (index in array[i]) {
          if (line !== '') {
            line += ',';
          }
          line += array[i][index];
        }
        str += line + '\r\n';
        i++;
      }
      return str;
    };
  });

}).call(this);
