angular.module('bssApp').factory 'Client', ($resource) ->
  $resource('/api/users/:user_id/clients/:id', {},
    show:
      method: 'GET'
      params:
        user_id: '@user_id'
        id: '@id'
    update:
      method: 'PUT'
      params:
        user_id: '@user_id'
        id: '@id'
    delete:
      method: 'DELETE'
      params:
        user_id: '@user_id'
        id: '@id'
  )