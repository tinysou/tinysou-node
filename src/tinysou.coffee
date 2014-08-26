Client = require './client'
Engine = require './engine'


class Tinysou
  constructor: (@token) ->
    @client = new Client @token
    @engines = new Engine @client


module.exports = Tinysou
