BaseModel = require './base'

module.exports = class Player extends BaseModel
  @collectionName: 'players'

  getByName: (name) ->
    return @_collectionConnector()
      .find { name }

  create: (name) ->
    return @_collectionConnector()
      .add @build {name}

  build: ({ name }) ->
    return {
      name
    }
