Client = require './client'
Engine = require './engine'
Collection = require './collection'
Document = require './document'


class Tinysou
  constructor: (@token) ->
    @client = new Client @token
    @engines = new Engine @client
    @collections = new Collection @client
    @documents = new Document @client


module.exports = Tinysou
