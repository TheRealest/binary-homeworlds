BaseModel = require './base'

module.exports = class Player extends BaseModel
  @collectionName: 'players'

  getByName: (name) ->
    return @_collectionConnector()
      .find { name }

  createPlayer: (name) ->
    return @_collectionConnector()
      .add @_buildPlayer {name}

  _buildPlayer: ({ name }) ->
    return {
      name
    }
