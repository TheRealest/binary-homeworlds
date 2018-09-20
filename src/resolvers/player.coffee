module.exports = PlayerResolvers =
  Query:
    player: (_parent, { id, name }, { models: {Player} }) ->
      return if id
        Player.getById id
      else if name
        Player.getByName name
      else
        null

  Mutation:
    createPlayer: (_parent, { name }, { models: {Player} }) ->
      return Player.createPlayer name

  Player:
    games: (parent, _args, { models: {Game} }) ->
      return Game.fromPlayerId parent.id
