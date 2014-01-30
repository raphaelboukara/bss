bssApp = angular.module('bssApp', ['ngRoute', 'ngResource', 'ngAnimate'])

bssApp.config ($routeProvider) ->
	$routeProvider.when '/', redirectTo: '/users'
	$routeProvider.when '/users', templateUrl: 'templates/users.html', controller: 'UsersController',
	$routeProvider.when '/users/:userId', templateUrl: 'templates/user.html', controller: 'UserController'
	$routeProvider.when '/users/:userId/clients/:clientId', templateUrl: 'templates/client.html', controller: 'ClientController'

bssApp.directive 'animateScreen', ($animate) ->
	(scope, element, attrs) ->
		scope.$watch attrs.animateScreen, (newVal) ->
			tl = new TimelineLite()
			if newVal
				$(element).height 0
				title = $(element).find("h1")
				tl.to element, 0.5,
				  height: "100%"
				  onComplete: $("html,body").animate(
							  	  scrollTop: $(element).offset().top
								  , 500)
				tl.from element.find("h1"), 1,
					alpha: 0

			else
				tl.to element.find("h1"), 0.5,
					alpha: 0
				tl.to element, 0.5,
				  	height: 0