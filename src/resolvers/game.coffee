moment = require 'moment'

module.exports = GameResolvers =
  Query:
    game: (_parent, { id, name }, { models: {Game} }) ->
      return if id
        Game.getById id
      else if name
        Game.getByName name
      else
        null

  Mutation:
    createGame: (_parent, { name }, { models: {Game} }) ->
      return Game.createGame name
