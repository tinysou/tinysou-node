class Engine
  constructor: (@client) ->

  list: (callback) ->
    @client.get '/engines', {}, callback

  create: (engine, callback) ->
    @client.post '/engines', engine, callback

  get: (engineName, callback) ->
    @client.get "/engines/#{engineName}", {}, callback

  update: (engineName, engine, callback) ->
    @client.put "/engines/#{engineName}", engine, callback

  delete: (engineName, callback) ->
    @client.delete "/engines/#{engineName}", {}, callback


module.exports = Engine
