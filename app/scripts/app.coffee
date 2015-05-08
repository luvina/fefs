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

# Define url and template file
App.config ($stateProvider, $urlRouterProvider) ->
  $stateProvider
  .state('tab',
    url: '/tab'
    abstract: true
    templateUrl: 'templates/tabs.html'
# Home page is add vehicle page
  ).state('tab.add',
    url: '/add'
    views:
      'add-tab':
        templateUrl: 'templates/add.html',
        controller: 'HomeCtrl'
# List vehicle page
  ).state('tab.list',
    url: '/list'
    views:
      'list-tab':
        templateUrl: 'templates/list.html',
        controller: 'vehicleSearchList'
# About page
  ).state('tab.about',
    url: '/about'
    views:
      'about-tab':
        templateUrl: 'templates/about.html'
  )

# Another url is redirect to add page
  $urlRouterProvider.otherwise '/tab/add'