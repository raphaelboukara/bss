angular.module('bssApp').controller "UsersController", ($scope, Users) ->
     
  $scope.init = -> 
    alert "haut:"+screen.height+" larg:"+screen.width
    @usersService = new Users(serverErrorHandler)
    $scope.users = @usersService.all()
    $scope.master =
      name: ""
      email: ""
    $scope.user = angular.copy $scope.master;
  
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