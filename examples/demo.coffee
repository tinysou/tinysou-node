Tinysou = require 'tinysou'

TOKEN = 'YOUR_TOKEN'

engine = {
  name: 'YOUR-blog',
  display_name: 'Blog'
}

collection = {
  name: 'posts',
  field_types: {
    title: 'string',
    tags: 'string',
    author: 'enum',
    date: 'date',
    body: 'text'
  }
}

document = {
  title: 'My First Post',
  tags: ['news'],
  author: 'Author',
  date: new Date().getTime(),
  body: 'Tinysou start online today!'
}

tinysou = new Tinysou TOKEN

searchInfo = {
  q: 'tinysou'
  c: 'posts'
  page: 0,
  per_parge: 10,
  sort:{
    field: "date",
    order: "asc",
    mode: "avg"
  }
}

autocompleteInfo = {
  q: 'fir',
  c: 'posts'
  sort:{
    field: "date",
    order: "asc",
    mode: "avg"
  }
}

display = (msg, err, res) ->
  console.log(msg)
  if err
    console.log(err)
  else
    console.log(res)

tasks = {
  listEngines: ->
    tinysou.engines.list (err, res) ->
      display('List engines', err, res)

  createEngine: ->
    tinysou.engines.create engine, (err, res) ->
      display('Create an engine', err, res)

  getEngine: ->
    tinysou.engines.get engine.name, (err, res) ->
      display('Get an engine', err, res)

  updateEngine: ->
    tinysou.engines.update engine.name, engine, (err, res) ->
      display('Update an engine', err, res)

  deleteEngine: ->
    tinysou.engines.delete engine.name, (err, res) ->
      display('Delete an engine', err, res)

  listCollections: ->
    tinysou.collections.list engine.name, (err, res) ->
      display("List collections in #{engine.name}", err, res)

  createCollection: ->
    tinysou.collections.create engine.name, collection, (err, res) ->
      display('Create a collection', err, res)

  getCollection: ->
    tinysou.collections.get engine.name, collection.name, (err, res) ->
      display('Get a collection', err, res)

  deleteCollection: ->
    tinysou.collections.delete engine.name, collection.name, (err, res) ->
      display('Delete a collection', err, res)

  listDocuments: ->
    tinysou.documents.list engine.name, collection.name, (err, res) ->
      display("List documents in #{collection.name}", err, res)

  createDocument: ->
    tinysou.documents.create engine.name, collection.name, document, (err, res) ->
      display('Create a document', err, res)

  getDocument: ->
    tinysou.documents.list engine.name, collection.name, (err, res) ->
      if err
        console.log(err)
      else if res.length > 0
        document_id = res[0].id
        tinysou.documents.get engine.name, collection.name, document_id, (err, res) ->
          display('Get a document', err, res)
      else
        console.log('Please create a document first')

  updateDocument: ->
    tinysou.documents.list engine.name, collection.name, (err, res) ->
      if err
        console.log(err)
      else if res.length > 0
        document_id = res[0].id
        tinysou.documents.update engine.name, collection.name, document_id, document, (err, res) ->
          display('Update a document', err, res)
      else
        console.log('Please create a document first')

  deleteDocument: ->
    tinysou.documents.list engine.name, collection.name, (err, res) ->
      if err
        console.log(err)
      else if res.length > 0
        document_id = res[0].id
        tinysou.documents.delete engine.name, collection.name, document_id, (err, res) ->
          display('Delete a document', err, res)
      else
        console.log('Please create a document first')

  search: ->
    tinysou.search engine.name, searchInfo, (err, res) ->
      display('Search in many collections', err, res)

  autocomplete: ->
    tinysou.autocomplete engine.name, autocompleteInfo, (err, res) ->
      display("autocomplete in many collections", err, res)
}


args = process.argv
if args.length == 3 and args[2] of tasks
  tasks[args[2]]()
else
  console.log('Available arguments are:')
  console.log(k) for k of tasks
