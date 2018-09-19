module.exports =
  Query:
    players: (_parent, _args, { dataSources: {storage} }) ->
      return storage.getPlayers()
    player: (_parent, { id }, { dataSources: {storage} }) ->
      return storage.findPlayer id

  Mutation:
    createPlayer: (_parent, { name }, { dataSources: {storage} }) ->
      storage.createPlayer name
