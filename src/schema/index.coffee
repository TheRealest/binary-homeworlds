QuerySchema = "type Query {
  game(id: ID, name: String): Game
  games: [Game!]!

  player(id: ID, name: String): Player

  ship(id: ID!): Ship
  ships: [Ship!]!
}"

MutationSchema = "type Mutation {
  createGame(input: CreateGameInput!): Game

  createPlayer(input: CreatePlayerInput!): Player
  joinGame(input: JoinGameInput!): Player

  createShip(input: CreateShipInput!): Ship
}"

module.exports = [
  QuerySchema,
  MutationSchema,

  require './game'
  require './player'
  require './ship'
]
