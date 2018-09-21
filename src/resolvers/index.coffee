RootResolvers =
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

    player: (_parent, { id, name }, { models: {Player} }) ->
      return if id
        Player.getById id
      else if name
        Player.getByName name
      else
        null

    ship: (_parent, { id }, { models: {Ship} }) ->
      return Ship.getById id
    ships: (_parent, _args, { models: {Ship} }) ->
      return Ship.getAll()

  Mutation:
    createGame: (_parent, { input: {name} }, { models: {Game} }) ->
      return Game.create name

    createPlayer: (_parent, { input: {name} }, { models: {Player} }) ->
      return Player.create name
    joinGame: (_parent, { input: {playerId, gameId} }, { models: {Game, Player} }) ->
      Game.addPlayer gameId, playerId
      return Player.getById playerId

    createShip: (_parent, { input: {ownerId, gamePiece} }, { models: {Ship, GamePiece} }) ->
      {id: gamePieceId} = GamePiece.create gamePiece
      return Ship.create ownerId, gamePieceId

module.exports = [
  RootResolvers

  require './game'
  require './player'
  require './ship'

  require './scalars/moment'
]
