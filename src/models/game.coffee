BaseModel = require './base'

module.exports = class Game extends BaseModel
  @collectionName: 'games'

  getByName: (name) ->
    return @_collectionConnector()
      .find { name }

  fromPlayerId: (playerId) ->
    return @_collectionConnector()
      .findAll {playerIds: playerId}

  create: (name) ->
    return @_collectionConnector()
      .add @build {name}

  addPlayer: (gameId, playerId) ->
    return @_collectionConnector()
      .push gameId, 'playerIds', playerId

  build: ({ name }) ->
    return {
      name
      playerIds: []
    }
