# This class process business logic of action in controller
angular.module('app')
# Contructor
.factory('VehicleData',() ->
  _vehicles = []

# Get vehicles
  {
  get: ->
    _vehicles

# Set vehicles
  ,set: (vehicles) ->
    _vehicles = vehicles

    return
  }
)

# List vehicle controller
.controller('vehicleSearchList', ($scope,VehicleData) ->

# Set scope data of vehicle list
  $scope.vehicles = VehicleData.get()
  
  return
)

# Add vehicle controller
.controller('HomeCtrl', ($scope,VehicleData) ->
# Process upload image
  $scope.uploadImage = ->
  document.addEventListener 'deviceready', (->
    options =
      quality: 50
      destinationType: Camera.DestinationType.DATA_URL
      sourceType: Camera.PictureSourceType.CAMERA
      allowEdit: true
      encodingType: Camera.EncodingType.JPEG
      targetWidth: 100
      targetHeight: 100
      popoverOptions: CameraPopoverOptions
      saveToPhotoAlbum: false
    $cordovaCamera.getPicture(options).then ((imageData) ->
      image = document.getElementById('myImage')
      image.src = 'data:image/jpeg;base64,' + imageData
      return
    ), (err) ->
# Error
      return
    return
  ), false

# Initial object to save
  $scope.vehicle={}
  $scope.vehicles = VehicleData.get()

# Save data
  $scope.addVehicle = ->
    $scope.vehicles.push($scope.vehicle)

    VehicleData.set($scope.vehicles)

# Storage data
    localStorage.setItem('vehicleName', $scope.vehicle.name)
    localStorage.setItem('vehicleType', $scope.vehicle.type)
    localStorage.setItem('vehicleImage', $scope.vehicle.image.base64)
    return

# Make object for saving in csv file
  exportDataToCSV = (objArray) ->
    array = objArray
    str = ''
    i = 0
    while i < array.length
      line = ''
      for index of array[i]
        if line != ''
          line += ','
        line += array[i][index]
      str += line + '\r\n'
      i++
    str
  return
)