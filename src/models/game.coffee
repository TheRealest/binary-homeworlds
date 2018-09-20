BaseModel = require './base'

module.exports = class Game extends BaseModel
  collectionName: 'games'

  getByName: (name) ->
    return @_collectionConnector()
      .find { name }

  createGame: (name) ->
    return @_collectionConnector()
      .create {name}
