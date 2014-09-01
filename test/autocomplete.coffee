assert = require 'assert'
nock = require 'nock'
Tinysou = require '../lib/tinysou'

describe 'Autocomplete', ->
  before ->
    @tinysou = new Tinysou 'token'
    @engine = {
      name: 'blog',
      display_name: 'Blog'
    }
    @collection = {
      name: 'posts',
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
      date: new Date().getTime(),
      body: 'Tinysou start online today!'
    }
    @host = 'http://api.tinysou.com'

    @autocompleteInfo = {
      q: 'fir',
      c: 'posts'
      page: 0,
      per_parge: 10,
      sort:{
        field: "date",
        order: "asc",
        mode: "avg"
      }
    }

  it 'should autocomplete in collections', ->
    nock(@host)
      .post("/v1/engines/#{@engine.name}/autocomplete")
      .reply(201, @document)
    document = @document
    autocompleteInfo = @autocompleteInfo
    @tinysou.autocomplete @engine.name, autocompleteInfo, (err, res) ->
      assert.equal document.title, res.title
