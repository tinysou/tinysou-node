assert = require 'assert'
nock = require 'nock'
Tinysou = require '../lib/tinysou'


describe 'Collection', ->
  before ->
    tinysou = new Tinysou 'token'
    @collections = tinysou.collections
    @engine = {
      name: 'blog',
      display_name: 'Blog'
    }
    @collection = {
      name: 'post',
      field_types: {
        title: 'string',
        tags: 'string',
        author: 'enum',
        date: 'date',
        body: 'text'
      }
    }
    @host = 'http://api.tinysou.com'

  it 'should list collections', ->
    nock(@host)
      .get("/v1/engines/#{@engine.name}/collections")
      .reply(200, @collection)
    collection = @collection
    @collections.list @engine.name, (err, res) ->
      assert.equal collection.name, res.name

  it 'should create a collection', ->
    nock(@host)
      .post("/v1/engines/#{@engine.name}/collections")
      .reply(201, @collection)
    collection = @collection
    @collections.create @engine.name, @collection, (err, res) ->
      assert.equal collection.name, res.name

  it 'should get a collection', ->
    nock(@host)
      .get("/v1/engines/#{@engine.name}/collections/#{@collection.name}")
      .reply(200, @collection)
    collection = @collection
    @collections.get @engine.name, @collection.name, (err, res) ->
      assert.equal collection.name, res.name

  it 'should delete a collection', ->
      nock(@host)
        .delete("/v1/engines/#{@engine.name}/collections/#{@collection.name}")
        .reply(204)
      @collections.delete @engine.name, @collection.name, (err, res) ->
        assert.equal true, res
