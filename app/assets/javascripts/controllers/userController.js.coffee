angular.module('bssApp').controller "UserController", ($scope, $routeParams, User, Clients) ->
     
  $scope.init = -> 
    @userService = new User(serverErrorHandler)
    $scope.user = @userService.find $routeParams.userId, (user) ->
      $scope.editUser =
        id: user.id
        name: user.name
        email: user.email
    @clientService = new Clients($routeParams.userId, serverErrorHandler)
    $scope.clients = @clientService.all()
    $scope.master =
      name: ""
      email: ""
      user_id: $routeParams.userId
    $scope.client = angular.copy $scope.master;

  $scope.updateUser = (user) ->
    @userService.update user,
      (data) -> 
        $scope.user = data
        $scope.editUser = 
          id: data.id
          name: data.name
          email: data.email

  $scope.createClient = (client) ->
    @clientService.create client, 
      (data) ->
          $scope.clients.unshift data
          $scope.client = angular.copy $scope.master

  $scope.deleteClient = (id, ids) ->
    if confirm "Are you sure you want to remove this client?"
      @clientService.delete id, 
      -> $scope.clients.splice(ids, 1) ,
      -> serverErrorHandler
      
  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")