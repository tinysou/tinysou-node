Client = require './client'
Engine = require './engine'
Collection = require './collection'
Document = require './document'
Search = require './search'


class Tinysou
  constructor: (@token) ->
    @client = new Client @token
    @engines = new Engine @client
    @collections = new Collection @client
    @documents = new Document @client
    @search = new Search @client


module.exports = Tinysou
