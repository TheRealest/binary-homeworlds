QuerySchema = "type Query {
  players: [Player!]!
  player(id: ID!): Player
}"

MutationSchema = "type Mutation {
  createPlayer(name: String!): Player
}"

PlayerSchema = "type Player {
  id: ID!
  name: String!
} "


module.exports = [
  QuerySchema,
  MutationSchema,
  PlayerSchema

  require './game'
]
