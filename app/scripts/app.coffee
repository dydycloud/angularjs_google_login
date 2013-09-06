'use strict'

angular.module('frontendApp', ['googleOauth'])
  .config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/oauth2callback',
        templateUrl: '/views/oauth2callback.html'
        controller: 'CallbackCtrl'
      .otherwise
        redirectTo: '/'
    $locationProvider.html5Mode(true)
  ])

  .config (TokenProvider) ->
    TokenProvider.extendConfig
      clientId: '236823754682-c22gabjasrta49kj9cnjcqo0cmmfppov.apps.googleusercontent.com'
      redirectUri: 'http://localhost:9000/oauth2callback'
      scopes: ['https://www.googleapis.com/auth/userinfo.email']
