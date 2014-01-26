angular.module('bssApp').controller "UserController", ($scope, $routeParams, $location, Users) ->
     
  $scope.init = -> 
    @userService = new Users(serverErrorHandler)
    $scope.user = @userService.find $routeParams.userId, (user) ->
      $scope.editUser =
        id: user.id
        name: user.name
        email: user.email

  $scope.updateUser = (user) ->
    @userService.update user,
      (data) -> 
        $scope.user = data
        $scope.editUser = 
          id: data.id
          name: data.name
          email: data.email
      
  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")