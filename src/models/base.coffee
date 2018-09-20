module.exports = class BaseModel
  #@collectionName: should specify static property in child model, will be copied to instance

  constructor: (@connector) ->
    @collectionName = @constructor.collectionName

  getById: (id) ->
    return @_collectionConnector()
      .get id

  _collectionConnector: ->
    return @connector.collection @collectionName
