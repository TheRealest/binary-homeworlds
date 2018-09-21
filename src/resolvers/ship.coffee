module.exports = ShipResolvers =
  Ship:
    owner: (parent, _args, { models: {Player} }) ->
      return Player.getById parent.ownerId
    gamePiece: (parent, _args, { models: {GamePiece} }) ->
      return GamePiece.getById parent.gamePieceId
