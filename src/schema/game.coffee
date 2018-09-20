GameSchema = """
type Game {
  id: ID!
  createdAt: Moment
  name: String

  players: [Player!]!
  currentPlayer: Player

  #bank: Bank!
  #stars: [Star!]!
  #ships: [Ship!]!
  #homeworlds: [Homeworld!]!
}
"""

module.exports = -> [
  GameSchema

  require './scalars/moment'

  require './player'
  #require './bank'
  #require './star'
  #require './ship'
  #require './homeworld'
]
