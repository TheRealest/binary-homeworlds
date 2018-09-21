GamePieceSchema = """
type GamePiece {
  id: ID!
  createdAt: Moment!

  color: Color!
  size: Size!
  position: Position!
}
type Position {
  x: Int!
  y: Int!
}
"""

GamePieceInput = """
input GamePieceInput {
  color: Color!
  size: Size!
  position: PositionInput!
}
input PositionInput {
  x: Int!
  y: Int!
}
"""

module.exports = -> [
  GamePieceSchema
  GamePieceInput

  require './scalars/moment'
  require './scalars/color'
  require './scalars/size'
]
