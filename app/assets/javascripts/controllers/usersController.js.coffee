angular.module('bssApp').controller "UsersController", ($scope, Users, User) ->
     
  $scope.init = -> 
    @usersService = new User(serverErrorHandler)
    $scope.users = Users.query()
    $scope.openUsers = []
    $scope.master =
      name: ""
      email: ""
    $scope.user = angular.copy $scope.master;
  
  $scope.createUser = (args) ->
    Users.create args, 
      (data) ->
          $scope.users.unshift data
          $scope.user = angular.copy $scope.master,
      (error) ->
          args.errors = error.data.errors

  $scope.deleteUser = (id, ids) ->
    if confirm "Are you sure you want to remove this user?"
      User.delete
        id: id, 
        -> $scope.users.splice(ids, 1) ,
        -> serverErrorHandler

  $scope.addOpenUser = (user) ->
    $scope.openUsers.unshift user

  $scope.removeOpenUser = (ids) ->
    $scope.openUsers.splice(ids, 1)

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")