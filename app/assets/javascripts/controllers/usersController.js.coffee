angular.module('bssApp').controller "UsersController", ($scope, $routeParams, $location, Users) ->
     
  $scope.init = -> 
    @usersService = new Users(serverErrorHandler)
    $scope.users = @usersService.all()
  
  $scope.createUser = (user) ->
    @usersService.create user, 
      (data) ->
          $scope.users.unshift data
          $scope.user = angular.copy $scope.master

  $scope.deleteUser = (id, ids) ->
    if confirm "Are you sure you want to remove this user?"
      @usersService.delete id, 
      -> $scope.users.splice(ids, 1) ,
      -> serverErrorHandler

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")