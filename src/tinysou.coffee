Client = require './client'
Engine = require './engine'
Collection = require './collection'


class Tinysou
  constructor: (@token) ->
    @client = new Client @token
    @engines = new Engine @client
    @collections = new Collection @client


module.exports = Tinysou
