angular.module('bssApp').controller "ClientController", ($scope, $routeParams, Users, Clients) ->
     
  $scope.init = -> 
    @clientService = new Clients($routeParams.userId, serverErrorHandler)
    $scope.client = @clientService.find $routeParams.clientId, (client) ->
      $scope.editClient =
        id: client.id
        name: client.name
        email: client.email
        user_id: client.user_id

  $scope.updateClient = (client) ->
    @clientService.update client,
      (data) -> 
        $scope.client = data
        $scope.editClient = 
          id: data.id
          name: data.name
          email: data.email
          user_id: data.user_id
      
  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")