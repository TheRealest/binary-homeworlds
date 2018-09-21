PlayerSchema = """
type Player {
  id: ID!
  createdAt: Moment
  name: String

  games: [Game!]!
}
"""

CreatePlayerInput = """
input CreatePlayerInput {
  name: String!
}
"""

module.exports = -> [
  PlayerSchema
  CreatePlayerInput

  require './scalars/moment'

  require './game'
]
