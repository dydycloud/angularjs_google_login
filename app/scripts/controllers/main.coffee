'use strict'

angular.module('frontendApp')
  .controller 'MainCtrl', ($scope, $http, $location, $window, Token) ->
    $scope.accessToken = Token.get()
    $scope.authenticate = ->
      extraParams = (if $scope.askApproval then approval_prompt: "force" else {})
      Token.getTokenByPopup(extraParams).then ((params) ->
        # Success getting token from popup.

        # Verify the token before setting it, to avoid the confused deputy problem.
        Token.verifyAsync(params.access_token).then ((data) ->
          $scope.accessToken = params.access_token
          $scope.expiresIn = params.expires_in
          Token.set params.access_token
        ), ->
          alert "Failed to verify token."
      ), ->

        # Failure getting token from popup.
        alert "Failed to get token from popup."
