GameSchema = """
type Game {
  id: ID!
  createdAt: Moment
  name: String

  players: [Player!]!
  currentPlayer: Player

  ships: [Ship!]!
  #stars: [Star!]!
  #homeworlds: [Homeworld!]!
  #bank: Bank!
}
"""

CreateGameInput = """
input CreateGameInput {
  name: String!
}
"""

JoinGameInput = """
input JoinGameInput {
  playerId: String!
  gameId: String!
}
"""

module.exports = -> [
  GameSchema
  CreateGameInput
  JoinGameInput

  require './scalars/moment'

  require './player'
  #require './bank'
  #require './star'
  require './ship'
  #require './homeworld'
]
