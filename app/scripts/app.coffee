# This class define template and controller application

App = angular.module('app', ['ionic','naif.base64'])

App.run ($ionicPlatform) ->

  $ionicPlatform.ready ->
    # Hide the accessory bar by default (remove this to show the accessory
    #  bar above the keyboard for form inputs)
    if window.cordova && window.cordova.plugins.Keyboard
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true)

    if window.StatusBar
      # org.apache.cordova.statusbar required
      StatusBar.styleDefault()

# Define url and create tabs that mapping template file

# Create tabs
App.config ($stateProvider, $urlRouterProvider) ->
  $stateProvider
# Tab index
  .state('tab',
    url: '/tab'
    abstract: true
    templateUrl: 'templates/tabs.html'
# Home page is add vehicle tab that call HomeCtrl
  ).state('tab.add',
    url: '/add'
    views:
      'add-tab':
        templateUrl: 'templates/add.html',
        controller: 'HomeCtrl'
# List vehicle tab that call vehicleSearchList controller
  ).state('tab.list',
    url: '/list'
    views:
      'list-tab':
        templateUrl: 'templates/list.html',
        controller: 'vehicleSearchList'
# About tab
  ).state('tab.about',
    url: '/about'
    views:
      'about-tab':
        templateUrl: 'templates/about.html'
  )

# Another url is redirect to add tab
  $urlRouterProvider.otherwise '/tab/add'