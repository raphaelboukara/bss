angular.module('bssApp').factory 'Clients', ($resource) ->

  class Clients

    constructor: (userId, errorHandler) ->
      @service = $resource('/api/users/:user_id/clients/:id',
        {user_id: userId, id: '@id'},
        {update: {method: 'PUT'}})
      @errorHandler = errorHandler

    create: (attrs, successHandler) ->
      new @service(client: attrs).$save (
        (client) -> 
          attrs.id = client.id
          successHandler (client)), 
        (error) -> 
          attrs.errors = error.data.errors

    update: (attrs, successHandler) ->
      new @service(user: attrs).$update {userId: attrs.id}, 
        ((user) -> 
          successHandler (attrs)), 
        ((error) -> 
          attrs.errors = error.data.errors)

    delete: (id, successHandler, errorHandler) ->
      new @service().$delete {id: id}, 
        (-> successHandler()), 
        (-> errorHandler())

    all: ->
      @service.query((-> null), @errorHandler)

    find: (id, successHandler) ->
      @service.get {userId: id}, ((user)-> 
        successHandler?(user)
        user), @errorHandler