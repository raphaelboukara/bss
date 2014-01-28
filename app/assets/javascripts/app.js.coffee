bssApp = angular.module('bssApp', ['ngRoute', 'ngResource', 'ui.bootstrap'])

bssApp.config ($routeProvider) ->
	$routeProvider.when '/', redirectTo: '/users'
	$routeProvider.when '/users', templateUrl: 'templates/users.html', controller: 'UsersController',
	$routeProvider.when '/users/:userId', templateUrl: 'templates/user.html', controller: 'UserController'
	$routeProvider.when '/users/:userId/clients/:clientId', templateUrl: 'templates/client.html', controller: 'ClientController'
