module.exports = PlayerResolvers =
  Player:
    games: ({ id }, _args, { models: {Game} }) ->
      return Game.fromPlayerId id
