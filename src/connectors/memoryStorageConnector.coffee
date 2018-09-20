moment = require 'moment'
uuid = require 'uuid'

memoryStorage =
  games: []
  players: []

# NOTE: the objects returned from this connector are the actual objects in storage in memory -- do
# not try to modify them, instead use the proper methods
module.exports = class MemoryStorageConnector
  constructor: ->
    @storage = memoryStorage

    # temp vars to allow for a chained query DSL
    @collectionName = null

  ## CHAIN METHODS
  collection: (@collectionName) ->
    return @

  ## DOCUMENT GETTERS
  find: (filter) ->
    return @_getCollection().find(@_documentMatchesPropertyFilter.bind(@, filter)) || null

  findAll: (filter) ->
    return @_getCollection().filter(@_documentMatchesPropertyFilter.bind(@, filter))

  get: (id) ->
    return @find { id }

  ## DOCUMENT MODIFIERS
  create: (doc) ->
    @_getCollection().push doc

    doc.id ||= uuid()
    doc.createdAt = moment()
    return doc

  # only suitable for scalar properties e.g. strings or numbers
  update: (id, properties) ->
    return Object.assign @get(id), properties

  ## ARRAY METHODS
  push: (id, arrayProp, element) ->
    @_getArrayProperty(id, arrayProp).push element
    return element

  pop: (id, arrayProp) ->
    return @_getArrayProperty(id, arrayProp).pop()

  unshift: (id, arrayProp, element) ->
    @_getArrayProperty(id, arrayProp).unshift element
    return element

  shift: (id, arrayProp) ->
    return @_getArrayProperty(id, arrayProp).shift()

  ## PRIVATE METHODS
  _getCollection: ->
    throw new MemoryStorageError 'missing collection' unless @collectionName
    unless (collection = @storage[@collectionName])? && Array.isArray collection
      throw new MemoryStorageError "collection '#{@collectionName}' does not exist"

    @collectionName = null
    return collection

  _documentMatchesPropertyFilter: (filter, doc) ->
    return Object.keys(filter).reduce (allMatch, key) ->
      return allMatch && doc[key] == filter[key]
    , true

  _getArrayProperty: (id, arrayProp) ->
    unless (array = @get(id)[arrayProp])? && Array.isArray array
      throw new MemoryStorageError "document with id '#{id}' has no array property named '#{arrayProp}'"

    return array

class MemoryStorageError extends Error
  constructor: (message) ->
    super message
    @name = @constructor.name
