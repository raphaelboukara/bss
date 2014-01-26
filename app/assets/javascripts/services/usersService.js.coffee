angular.module('bssApp').factory 'Users', ($resource) ->

  class Users

    constructor: (errorHandler) ->
      @service = $resource('/api/users/:userId',
        {userId: '@id'},
        {update: {method: 'PUT'}})
      @errorHandler = errorHandler

    create: (attrs, successHandler, errorHandler) ->
      new @service(user: attrs).$save (
        (user) -> 
          attrs.id = user.id
          successHandler (attrs)), 
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

    all: ->
      @service.query((-> null), @errorHandler)

    find: (id, successHandler) ->
      @service.get {userId: id}, ((user)-> 
        successHandler?(user)
        user), @errorHandler