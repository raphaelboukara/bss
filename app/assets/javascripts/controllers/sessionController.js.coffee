angular.module('bssApp').controller "SessionController", ($scope, $location, $routeParams, Session) ->

  $scope.init = ->
    $scope.master =
      email: ""
      password: ""
    $scope.session = angular.copy $scope.master;

  $scope.signIn = (args) ->
    Session.create args, 
      (data) ->
        console.log data
        $location.path "/user"
      (error) ->
        console.log error
        args.error = error.data.error
      
  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")