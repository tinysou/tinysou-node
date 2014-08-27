class Collection
  constructor: (@client) ->

  list: (engineName, callback) ->
    @client.get "/engines/#{engineName}/collections", {}, callback

  create: (engineName, collection, callback) ->
    @client.post "/engines/#{engineName}/collections", collection, callback

  get: (engineName, collectionName, callback) ->
    @client.get "/engines/#{engineName}/collections/#{collectionName}", {}, callback

  delete: (engineName, collectionName, callback) ->
    @client.delete "/engines/#{engineName}/collections/#{collectionName}", {}, callback

module.exports = Collection
