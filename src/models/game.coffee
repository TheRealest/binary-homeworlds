BaseModel = require './base'

module.exports = class Game extends BaseModel
  @collectionName: 'games'

  getByName: (name) ->
    return @_collectionConnector()
      .find { name }

  fromPlayerId: (playerId) ->
    return @_collectionConnector()
      .findAll {playerIds: playerId}

  createGame: (name) ->
    return @_collectionConnector()
      .add @_buildGame {name}

  addPlayer: (gameId, playerId) ->
    return @_collectionConnector()
      .push gameId, 'playerIds', playerId

  _buildGame: ({ name }) ->
    return {
      name
      playerIds: []
    }
