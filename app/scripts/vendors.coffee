angular.module('app')
.factory('VehicleData',() ->
  _vehicles = []

# Contructor
  {
  get: ->
    _vehicles

  ,set: (vehicles) ->
    _vehicles = vehicles

    return
  }
)

.controller('vehicleSearchList', ($scope,VehicleData) ->
  
  $scope.vehicles = VehicleData.get()
  
  return
)

.controller('HomeCtrl', ($scope,VehicleData) ->
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
# error
      return
    return
  ), false

  $scope.vehicle={}
  $scope.vehicles = VehicleData.get()

  $scope.addVehicle = ->
    $scope.vehicles.push($scope.vehicle)

    VehicleData.set($scope.vehicles)

    ###Storage data###
    localStorage.setItem('vehicleName', $scope.vehicle.name)
    localStorage.setItem('vehicleType', $scope.vehicle.type)
    localStorage.setItem('vehicleImage', $scope.vehicle.image.base64)
    return

  ###It will make object for saving in csv file###
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

