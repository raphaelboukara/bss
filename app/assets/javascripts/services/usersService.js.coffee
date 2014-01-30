angular.module('bssApp').factory 'Users', ['$resource', ($resource) ->
  $resource('/api/users',  {},
      query:
        method: 'GET',
        isArray: true
  )]

angular.module('bssApp').factory 'User', ($resource) ->

  class DDDDUsers

    constructor: (errorHandler) ->
      @service = $resource('/api/users/:userId',
        {userId: '@id'},
        {update: {method: 'PUT'}})
      @errorHandler = errorHandler

    create: (attrs, successHandler) ->
      new @service(user: attrs).$save (
        (user) -> 
          attrs.id = user.id
          successHandler (user)), 
        (error) -> 
          attrs.errors = error.data.errors

    update: (attrs, successHandler) ->
      new @service(user: attrs).$update {userId: attrs.id}, 
        ((user) -> 
          successHandler (attrs)), 
        ((error) -> 
          attrs.errors = error.data.errors)

    delete: (id, successHandler, errorHandler) ->
      new @service().$delete {userId: id}, 
        (-> successHandler()), 
        (-> errorHandler())

    find: (id, successHandler) ->
      @service.get {userId: id}, ((user)-> 
        successHandler?(user)
        user), @errorHandler