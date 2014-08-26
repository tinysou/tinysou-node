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

  get: (path, params, callback) ->
    request {
      method: 'GET',
      qs: params,
      url: @_buildUrl(path),
      json: true,
      headers: @headers
    }, (err, res, body) ->
      if err
        callback err
      else
        callback null, body

  post: (path, payload, callback) ->
    request {
      method: 'POST',
      body: payload,
      url: @_buildUrl(path),
      json: true,
      headers: @headers
    }, (err, res, body) ->
      if err
        callback err
      else
        callback null, body

  put: (path, payload, callback) ->
    request {
      method: 'PUT',
      body: payload,
      url: @_buildUrl(path),
      json: true,
      headers: @headers
    }, (err, res, body) ->
      if err
        callback err
      else
        callback null, body

  delete: (path, params, callback) ->
    request {
      method: 'DELETE',
      qs: params,
      url: @_buildUrl(path),
      json: true,
      headers: @headers
    }, (err, res, body) ->
      if err
        callback err
      else
        callback null, body


module.exports = Client
