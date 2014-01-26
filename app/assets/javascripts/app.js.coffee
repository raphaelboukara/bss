bssApp = angular.module('bssApp', ['ngRoute', 'ngResource'])

bssApp.config ($routeProvider) ->
	$routeProvider.when '/', redirectTo: '/users'
	$routeProvider.when '/users', templateUrl: 'templates/users.html', controller: 'UsersController',
	$routeProvider.when '/users/:userId', templateUrl: 'templates/user.html', controller: 'UserController'
