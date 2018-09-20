RootResolvers =
  Query: {}
  Mutation: {}

module.exports = [
  RootResolvers

  require './game'
  require './player'

  require './scalars/moment'
]
