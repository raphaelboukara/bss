angular.module('bssApp').factory 'Clients', ($resource) ->
  $resource('/api/users/:user_id/clients', {},
    query:
      method: 'GET',
      isArray: true
    create:
      method: 'POST'
      params:
        user_id: '@user_id'
  )