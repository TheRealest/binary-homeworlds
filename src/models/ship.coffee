BaseModel = require './base'

module.exports = class Ship extends BaseModel
  @collectionName: 'ships'

  create: (ownerId, gamePieceId) ->
    return @_collectionConnector()
      .add @build {ownerId, gamePieceId}

  build: ({ ownerId, gamePieceId }) ->
    return {
      ownerId
      gamePieceId
    }
