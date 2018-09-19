express = require 'express'
session = require 'express-session'
{ ApolloServer } = require 'apollo-server-express'

typeDefs = require './src/schema'
resolvers = require './src/resolvers'
{ MemoryStorageConnector } = require './src/connectors'

PORT = 4000

app = express()

app.use session
  secret: 'icehouse'
  cookie:
    maxAge: 1000*60*60

serverOptions = {
  typeDefs
  resolvers
  dataSources: -> { storage: new MemoryStorageConnector }
}
server = new ApolloServer serverOptions
server.applyMiddleware { app }

app.listen PORT, -> console.log "Listening on port #{PORT}"
