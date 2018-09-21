module.exports = GameResolvers =
  Game:
    players: ({ playerIds }, _args, { models: {Player} }) ->
      return (Player.getById(playerId) for playerId in playerIds)
    currentPlayer: ({ currentPlayerId }, _args, { models: {Player} }) ->
      return null unless currentPlayerId
      return Player.getById currentPlayerId

    ships: ({ shipIds }, _args, { models: {Ship} }) ->
      return (Ship.getById(shipId) for shipId in shipIds)
