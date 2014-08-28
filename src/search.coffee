class Search
  constructor: (@client) ->

  single: (engineName, collectionName, searchInfo, callback) ->
    @client.post "/engines/#{engineName}/collections/#{collectionName}/search", searchInfo, callback

  many: (engineName, searchInfo, callback) ->
    @client.post "/engines/#{engineName}/search", searchInfo, callback

module.exports = Search
