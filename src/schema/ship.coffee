ShipSchema = """
type Ship {
  id: ID!
  createdAt: Moment!
  owner: Player!
  gamePiece: GamePiece!
}
"""

CreateShipInput = """
input CreateShipInput {
  ownerId: ID!
  gamePiece: GamePieceInput!
}
"""

module.exports = -> [
  ShipSchema
  CreateShipInput

  require './scalars/moment'

  require './player'
  require './gamePiece'
]
