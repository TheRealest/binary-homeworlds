QuerySchema = "type Query {
  game(id: ID, name: String): Game
  games: [Game!]!
  player(id: ID, name: String): Player
}"

MutationSchema = "type Mutation {
  createGame(name: String!): Game
  createPlayer(name: String!): Player
  joinGame(playerId: String!, gameId: String!): Boolean!
}"

module.exports = [
  QuerySchema,
  MutationSchema,

  require './game'
  require './player'
]
