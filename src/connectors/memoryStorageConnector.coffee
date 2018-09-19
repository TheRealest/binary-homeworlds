uuid = require 'uuid'

memoryStorage =
  players: []

module.exports = class MemoryStorageConnector
  constructor: ->
    @storage = memoryStorage

  getPlayers: ->
    return @storage.players

  createPlayer: (name = '') ->
    newPlayer = {id: uuid(), name}
    @storage.players.push newPlayer
    return newPlayer

  findPlayer: (id) ->
    return @storage.players.find((player) -> player.id == id) || null
