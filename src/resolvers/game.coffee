module.exports = GameResolvers =
  Game:
    players: (parent, _args, { models: {Player} }) ->
      return (Player.getById(playerId) for playerId in parent.playerIds)
