assert = require 'assert'
nock = require 'nock'
Tinysou = require '../lib/tinysou'


describe 'Client', ->
  before ->
    tinysou = new Tinysou 'token'
    @client = tinysou.client
    @host = 'http://api.tinysou.com'

  it 'should have some basic config', ->
    assert.equal 'token', @client.token
    assert.equal 'api.tinysou.com', @client.host
    assert.equal 'v1', @client.version
    assert.equal 'Tinysou-Node/0.0.0', @client.userAgent
    assert.equal 'http://api.tinysou.com/v1', @client.baseUrl

  it 'should send GET request', ->
    nock(@host).get('/v1').reply(200, { version: '1' })
    @client.get '', {}, (err, res) ->
      assert.equal '1', res.version

  it 'should send POST request', ->
    nock(@host).post('/v1').reply(201, { version: '1' })
    @client.post '', {}, (err, res) ->
      assert.equal '1', res.version

  it 'should send PUT request', ->
    nock(@host).put('/v1').reply(200, { version: '1' })
    @client.put '', {}, (err, res) ->
      assert.equal '1', res.version

  it 'should send DELETE request', ->
    nock(@host).delete('/v1').reply(204)
    @client.delete '', {}, (err, res) ->
      assert.equal true, res
