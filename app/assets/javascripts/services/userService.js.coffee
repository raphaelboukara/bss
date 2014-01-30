angular.module('bssApp').factory 'User', ($resource) ->
  $resource('/api/users/:id', {},
    show:
      method: 'GET'
      params:
        id: '@id'
    update:
      method: 'PUT'
      params:
        id: '@id'
    delete:
      method: 'DELETE'
      params:
        id: '@id'
  )
