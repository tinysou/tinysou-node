Client = require './client'


class Tinysou
  constructor: (@token) ->
    @client = new Client @token


module.exports = Tinysou
