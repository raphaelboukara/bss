angular.module('bssApp').controller "UserController", ($scope, $location, $routeParams, Session, User, Clients, Client) ->
     
  $scope.init = -> 
    $scope.user = User.show 
                    id: 0,
                    (user) ->
                      $scope.editUser =
                        id: user.id
                        name: user.name
                        email: user.email
                      $scope.clients = Clients.query
                        user_id: user.id,
                    (error) ->
                      $location.path "/signin"

    $scope.master =
      name: ""
      email: ""
      user_id: 0
    $scope.client = angular.copy $scope.master;


  $scope.logOut = ->
    Session.delete
      id: 0
    $location.path "/signin"


  $scope.updateUser = (args) ->
    console.log args
    User.update args,
      (data) -> 
        $scope.user = data
        $scope.editUser = 
          id: data.id
          name: data.name
          email: data.email
      (error) ->
          args.errors = error.data.errors

  $scope.createClient = (args) ->
    Clients.create args,
      (data) ->
        $scope.clients.unshift data
        $scope.client = angular.copy $scope.master
      (error) ->
        args.errors = error.data.errors

  $scope.deleteClient = (id, ids) ->
    if confirm "Are you sure you want to remove this client?"
      Client.delete 
        user_id: $scope.editUser.id 
        id: id, 
        -> $scope.clients.splice(ids, 1) ,
        -> serverErrorHandler
      
  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")