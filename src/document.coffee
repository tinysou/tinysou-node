class Document
  constructor: (@client) ->

  list: (engineName, collectionName, callback) ->
    @client.get "/engines/#{engineName}/collections/#{collectionName}/documents", {}, callback

  create: (engineName, collectionName, document, callback) ->
    @client.post "/engines/#{engineName}/collections/#{collectionName}/documents", document, callback

  get: (engineName, collectionName, documentId, callback) ->
    @client.get "/engines/#{engineName}/collections/#{collectionName}/documents/#{documentId}", {}, callback

  update: (engineName, collectionName, documentId, document, callback) ->
    @client.put "/engines/#{engineName}/collections/#{collectionName}/documents/#{documentId}", document, callback

  delete: (engineName, collectionName, documentId, callback) ->
    @client.delete "/engines/#{engineName}/collections/#{collectionName}/documents/#{documentId}", {}, callback


module.exports = Document
