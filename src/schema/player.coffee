PlayerSchema = """
type Player {
  id: ID!
  createdAt: Moment
  name: String

  games: [Game!]!
}
"""

PlayerMutationSchema = """
"""

module.exports = -> [
  PlayerSchema
  PlayerMutationSchema

  require './scalars/moment'

  require './game'
]
