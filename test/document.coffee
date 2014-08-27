assert = require 'assert'
nock = require 'nock'
Tinysou = require '../lib/tinysou'


describe 'Document', ->
  before ->
    tinysou = new Tinysou 'token'
    @documents = tinysou.documents
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
    @document = {
      title: "My First Post",
      tags: ["news"],
      published_date: "2014-08-16T00:00:00Z",
      url: "http://blog.tinysou.com",
      body: "Tinysou start online today!"
    }
    @document_id = '293ddf9205df9b36ba5761d61ca59a29'
    @host = 'http://api.tinysou.com'

  it 'should list documents', ->
    nock(@host)
      .get("/v1/engines/#{@engine.name}/collections/#{@collection.name}/documents")
      .reply(200, @document)
    document = @document
    @documents.list @engine.name, @collection.name, (err, res) ->
      assert.equal document.title, res.title

  it 'should create a document', ->
    nock(@host)
      .post("/v1/engines/#{@engine.name}/collections/#{@collection.name}/documents")
      .reply(201, @document)
    document = @document
    @documents.create @engine.name, @collection.name, @document, (err, res) ->
      assert.equal document.title, res.title

  it 'should get a document', ->
    nock(@host)
      .get("/v1/engines/#{@engine.name}/collections/#{@collection.name}/documents/#{@document_id}")
      .reply(200, @document)
    document = @document
    @documents.get @engine.name, @collection.name, @document_id, (err, res) ->
      assert.equal document.title, res.title

  it 'should update a document', ->
    nock(@host)
      .put("/v1/engines/#{@engine.name}/collections/#{@collection.name}/documents/#{@document_id}")
      .reply(200, @document)
    document = @document
    @documents.update @engine.name, @collection.name, @document_id, @document, (err, res) ->
      assert.equal document.title, res.title

  it 'should delete a document', ->
    nock(@host)
      .delete("/v1/engines/#{@engine.name}/collections/#{@collection.name}/documents/#{@document_id}")
      .reply(204)
    @documents.delete @engine.name, @collection.name, @document_id, (err, res) ->
      assert.equal true, res
