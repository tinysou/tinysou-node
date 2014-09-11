request = require 'request'


class Client
  constructor: (@token) ->
    @host = 'api.tinysou.com'
    @version = 'v1'
    @userAgent = "Tinysou-Node/#{require('../package.json').version}"
    @baseUrl = "http://#{@host}/#{@version}"
    @headers = {
      'User-Agent': @userAgent,
      'Authorization': "token #{@token}"
    }

  _buildUrl: (path) ->
    @baseUrl + path

  request: (method, path, params, body, callback) ->
    request {
      method: method,
      qs: params,
      url: @_buildUrl(path),
      body: body,
      json: true,
      headers: @headers
    }, (err, res, body) ->
      if err
        callback err
      else if res.statusCode >= 400
        callback body
      else if res.statusCode == 204
        callback null, true
      else
        callback null, body

  get: (path, params, callback) ->
    @request 'GET', path, params, null, callback

  post: (path, body, callback) ->
    @request 'POST', path, null, body, callback

  put: (path, body, callback) ->
    @request 'PUT', path, null, body, callback

  delete: (path, params, callback) ->
    @request 'DELETE', path, params, null, callback


module.exports = Client
