assert = require 'assert'
nock = require 'nock'
Tinysou = require '../lib/tinysou'

describe 'Search', ->
  before ->
    tinysou = new Tinysou 'token'
    @search= tinysou.search
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
      title: 'My First Post',
      tags: ['news'],
      author: 'Author',
      date: '2014-08-16T00:00:00Z',
      body: 'Tinysou start online today!'
    }
    @host = 'http://api.tinysou.com'

    @searchInfo = {
      q: 'tinysou',
      c: 'post, document'
      page: '1',
      per_parge: '10',
      sort:{
        field: "date",
        order: "asc",
        mode: "avg"
      }
    }

  it 'should search in one collection', ->
    nock(@host)
      .post("/v1/engines/#{@engine.name}/collections/#{@collection.name}/search")
      .reply(201, @document)
    document = @document
    searchInfo = @searchInfo
    @search.single @engine.name, @collection.name, searchInfo, (err, res) ->
      assert.equal document.title, res.title

  it 'should search in collections', ->
    nock(@host)
      .post("/v1/engines/#{@engine.name}/search")
      .reply(201, @document)
    document = @document
    searchInfo = @searchInfo
    @search.many @engine.name, searchInfo, (err, res) ->
      assert.equal document.title, res.title






