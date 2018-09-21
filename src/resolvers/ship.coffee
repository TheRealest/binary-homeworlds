module.exports = ShipResolvers =
  Ship:
    owner: ({ ownerId }, _args, { models: {Player} }) ->
      return Player.getById ownerId
    gamePiece: ({ gamePieceId }, _args, { models: {GamePiece} }) ->
      return GamePiece.getById gamePieceId
