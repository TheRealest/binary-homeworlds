BaseModel = require './base'

module.exports = class GamePiece extends BaseModel
  @collectionName: 'gamePieces'

  @COLORS: COLORS = [
    'RED'
    'GREEN'
    'BLUE'
    'YELLOW'
  ]
  @SIZES: SIZES = [
    'SMALL'
    'MEDIUM'
    'LARGE'
  ]

  create: ({ color, size, position: {x, y} }) ->
    return @_collectionConnector()
      .add @build {color, size, position: {x, y}}

  build: ({ color, size, position: {x, y} }) ->
    return @validate {
      color
      size
      position: {x, y}
    }

  validate: (builtGamePiece) ->
    {color, size, position: {x, y}} = builtGamePiece
    unless color in COLORS
      throw new TypeError "invalid Color: #{color}"
    unless size in SIZES
      throw new TypeError "invalid Size: #{size}"
    unless typeof x == 'number' && typeof y == 'number'
      throw new TypeError "invalid position values: x=#{x}, y=#{y}"

    return builtGamePiece
