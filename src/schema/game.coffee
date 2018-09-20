GameSchema = """
type Game {
  id: ID!
  createdAt: Moment
  name: String

  #players: [Player!]!
  #currentPlayer: Player

  #bank: Bank!
  #stars: [Star!]!
  #ships: [Ship!]!
  #homeworlds: [Homeworld!]!
}
"""

GameQuerySchema = """
extend type Query {
  game(id: ID, name: String): Game
}
"""

GameMutationSchema = """
extend type Mutation {
  createGame(name: String!): Game
}
"""

module.exports = -> [
  GameSchema
  GameQuerySchema
  GameMutationSchema
  require './scalars/moment'
  #require './player'
  #require './bank'
  #require './star'
  #require './ship'
  #require './homeworld'
]
