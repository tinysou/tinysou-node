assert = require 'assert'
nock = require 'nock'
Tinysou = require '../lib/tinysou'


describe 'Engine', ->
  before ->
    tinysou = new Tinysou 'token'
    @engines = tinysou.engines
    @engine = {
      name: 'blog',
      display_name: 'Blog'
    }
    @host = 'http://api.tinysou.com'

  it 'should list engines', ->
    nock(@host).get('/v1/engines').reply(200, [@engine])
    engine = @engine
    @engines.list (err, res) ->
      assert.equal 1, res.length
      assert.equal engine.name, res[0].name
      assert.equal engine.display_name, res[0].display_name

  it 'should create an engine', ->
    nock(@host).post('/v1/engines').reply(201, @engine)
    engine = @engine
    @engines.create engine, (err, res) ->
      assert.equal engine.name, res.name
      assert.equal engine.display_name, res.display_name

  it 'should get an engine', ->
    nock(@host).get("/v1/engines/#{@engine.name}").reply(200, @engine)
    engine = @engine
    @engines.get engine.name, (err, res) ->
      assert.equal engine.name, res.name
      assert.equal engine.display_name, res.display_name

  it 'should update an engine', ->
    nock(@host).put("/v1/engines/#{@engine.name}").reply(200, @engine)
    engine = @engine
    @engines.update engine.name, engine, (err, res) ->
      assert.equal engine.name, res.name
      assert.equal engine.display_name, res.display_name

  it 'shoulb delete an engine', ->
    nock(@host).delete("/v1/engines/#{@engine.name}").reply(204)
    @engines.delete @engine.name, (err, res) ->
      assert.equal true, res
