angular.module('bssApp').factory 'Users', ['$resource', ($resource) ->
  $resource('/api/users',  {},
      query:
        method: 'GET',
        isArray: true
      create:
        method: 'POST'
  )]

