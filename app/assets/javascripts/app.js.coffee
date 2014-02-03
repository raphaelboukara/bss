bssApp = angular.module('bssApp', ['ngRoute', 'ngResource', 'ngAnimate'])


bssApp.config ($routeProvider) ->
	$routeProvider.when '/', redirectTo: '/user'
	$routeProvider.when '/signin', templateUrl: 'templates/signin.html', controller: 'SessionController'
	#$routeProvider.when '/users', templateUrl: 'templates/users.html', controller: 'UsersController'
	$routeProvider.when '/user', templateUrl: 'templates/user.html', controller: 'UserController'
	$routeProvider.when '/users/:userId/clients/:clientId', templateUrl: 'templates/client.html', controller: 'ClientController'