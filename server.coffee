express = require 'express'
session = require 'express-session'
{ ApolloServer } = require 'apollo-server-express'

typeDefs = require './src/schema'
resolvers = require './src/resolvers'
{ MemoryStorageConnector } = require './src/connectors'
modelClasses = require './src/models'

PORT = 4000

app = express()

app.use session
  secret: 'icehouse'
  cookie:
    maxAge: 1000*60*60

serverOptions = {
  typeDefs
  resolvers
  context: (context) ->
    storage = new MemoryStorageConnector
    models = {}
    for modelName, modelClass of modelClasses
      models[modelName] = new modelClass storage
    for _name, model of models
      model.setModels models

    return Object.assign context, { models }
}
server = new ApolloServer serverOptions
server.applyMiddleware { app }

app.listen PORT, -> console.log "Listening on port #{PORT}"
