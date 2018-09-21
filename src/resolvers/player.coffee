module.exports = PlayerResolvers =
  Player:
    games: (parent, _args, { models: {Game} }) ->
      return Game.fromPlayerId parent.id
