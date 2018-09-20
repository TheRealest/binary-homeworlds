module.exports = class BaseModel
  #collectionName: should specify in child model

  constructor: (@connector) ->

  getById: (id) ->
    return @_collectionConnector()
      .get id

  _collectionConnector: ->
    return @connector.collection @collectionName
