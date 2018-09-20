module.exports = GameResolvers =
  Query:
    game: (_parent, { id, name }, { models: {Game} }) ->
      return if id
        Game.getById id
      else if name
        Game.getByName name
      else
        null
    games: (_parent, _args, { models: {Game} }) ->
      return Game.getAll()

  Mutation:
    createGame: (_parent, { name }, { models: {Game} }) ->
      return Game.createGame name
    joinGame: (_parent, { playerId, gameId }, { models: {Game} }) ->
      Game.addPlayer gameId, playerId
      return true

  Game:
    players: (parent, _args, { models: {Player} }) ->
      return (Player.getById(playerId) for playerId in parent.playerIds)
