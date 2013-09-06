'use strict'

angular.module('frontendApp')
  .controller 'CallbackCtrl', ($scope, $http, $location, $window) ->
    $window.alert("works!")
    $window.close()
