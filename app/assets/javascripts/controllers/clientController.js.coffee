angular.module('bssApp').controller "ClientController", ($scope, $routeParams, Users, Clients, Client) ->
     
  $scope.init = ->
    $scope.client = Client.show 
                      user_id: $routeParams.userId
                      id: $routeParams.clientId,
                      (client) ->
                        $scope.editClient =
                          id: client.id
                          name: client.name
                          email: client.email
                          user_id: client.user_id,
                      serverErrorHandler

  $scope.updateClient = (args) ->
    Client.update args, 
      (data) -> 
        $scope.client = data
        $scope.editClient = 
          id: data.id
          name: data.name
          email: data.email
          user_id: data.user_id
      (error) ->
        args.errors = error.data.errors
      
  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")