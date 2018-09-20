{ GraphQLScalarType } = require 'graphql'
{ GraphQLError } = require 'graphql/error'
{ Kind } = require 'graphql/language'
moment = require 'moment'

module.exports = MomentType =
  Moment: new GraphQLScalarType
    name: 'Moment'
    description: 'Custom scalar type for using Moment to represent date timestamps'

    serialize: (value) ->
      unless moment.isMoment(value) || value instanceof Date
        throw new TypeError('Moment type error: value is not an instance of Moment or Date')
      if isNaN(value.valueOf())
        throw new TypeError('Moment type error: value is not a valid date')

      return value.valueOf()

    parseValue: (value) ->
      value = switch typeof value
        when 'string' then parseInt value, 10
        when 'number' then value
        else null
      date = moment value

      if isNaN(date.valueOf())
        throw new TypeError('Moment type error: value is not a valid date')

      return date

    parseLiteral: (ast) ->
      unless ast.kind == Kind.STRING || ast.kind == Kind.INT
        throw new GraphQLError 'Query error: Moment type only accepts epoch timestamp strings or numbers'
      value = switch ast.kind
        when Kind.STRING then parseInt ast.value, 10
        when Kind.INT then ast.value
        else null
      date = moment value

      if isNaN(date.valueOf())
        throw new GraphQLError 'Query error: invalid value for Moment type'

      return date
