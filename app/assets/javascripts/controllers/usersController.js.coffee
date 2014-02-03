angular.module('bssApp').controller "UsersController", ($scope, Users, User, $location, $anchorScroll) ->
     
  $scope.init = ->
    $scope.users = Users.query()
    $scope.openUsers = []
    $scope.master =
      name: ""
      email: ""
    $scope.user = angular.copy $scope.master;
  
  $scope.createUser = (args) ->
    Users.create args, 
      (data) ->
          console.log data
          $scope.users.unshift data
          $scope.user = angular.copy $scope.master,
      (error) ->
          console.log error
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