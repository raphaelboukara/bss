angular.module('bssApp').factory 'Session', ['$resource', ($resource) ->
  $resource('/api/sessions/:id',  {},
      query:
        method: 'GET',
        isArray: true
      create:
        method: 'POST'
      delete:
      	method: 'DELETE'
      	params:
      		id: '@id'
  )]