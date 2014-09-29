tinysou-node
============

[![Build Status](https://travis-ci.org/tinysou/tinysou-node.svg?branch=master)](https://travis-ci.org/tinysou/tinysou-node)

Tinysou node client

### Installation

```npm install tinysou```

### Usage

```javascript
var Tinysou = require('tinysou')
var tinysou = new Tinysou('your_token')
```

#### Engine

List:

```javascript
tinysou.engines.list(function(err, res) {
  console.log(res);
});
```

Create:

```javascript
tinysou.engines.create({
  name: 'blog',
  display_name: 'Blog'
}, function(err, res) {
  console.log(res);
});
```

Get:

```javascript
tinysou.engines.get('blog', function(err, res) {
  console.log(res);
});
```

Update:

```javascript
tinysou.engines.update('blog', {
  display_name: 'My Blog'
}, function(err, res) {
  console.log(res);
});
```

Delete:

```javascript
tinysou.engines.delete('blog', function(err, res) {
  console.log(res);
});
```

#### Collection

List

```javascript
tinysou.collections.list('blog', function(err, res) {
  console.log(res);
});
```

Create

```javascript
tinysou.collections.create('blog', {
  name: 'posts',
  field_types: {
    title: 'string',
    tags: 'string',
    author: 'enum',
    date: 'date',
    body: 'text'
  }
}, function(err, res) {
  console.log(res);
});
```

Get

```javascript
tinysou.collections.get('blog', 'posts', function(err, rest) {
  console.log(res);
});
```

Delete

```javascript
tinysou.collections.delete('blog', 'posts', function(err, res) {
  console.log(res);
});
```

#### Document

List

```javascript
tinysou.documents.list('blog', 'posts', function(err, res) {
  console.log(res);
});
```

Create

```javascript
tinysou.documents.create('blog', 'posts', {
  title: 'My First Post',
  tags: ['news'],
  author: 'Author',
  date: '2014-08-16T00:00:00Z',
  body: 'Tinysou start online today!'
}, function(err, res) {
  console.log(res);
});
```

Get

```javascript
tinysou.documents.get('blog', 'posts', documentId, function(err, res) {
  console.log(res);
});
```

Update

```javascript
tinysou.documents.update('blog', 'posts', documentId, {
  title: 'My First Post',
  tags: ['news'],
  author: 'Author',
  date: '2014-08-16T00:00:00Z',
  body: 'Tinysou start online today!'
}, fucntion(err, res) {
  console.log(res);
});
```

Delete

```javascript
tinysou.documents.delete('blog', 'posts', documentId, function(err, res) {
  console.log(res);
});
```

#### Search

Search in collections

```javascript
tinysou.search('blog', {
  q: 'tinysou',
  c: 'posts'
  page: 0,
  per_parge: 10,
  filter: {
    range: {
      field: "date",
      from: "2014-07-01T00:00:00Z",
      to: "2014-08-01T00:00:00Z"
    }
  },
  sort:{
    field: "date",
    order: "asc",
    mode: "avg"
  }
}, function(err, res) {
  console.log(res);
});
```

#### Autocomplete

Autocomplete in collections

```javascript
tinysou.autocomplete('blog', {
  q: 'tinys',
  c: 'posts'
  page: 0,
  per_parge: 10,
  filter: {
    range: {
      field: "date",
      from: "2014-07-01T00:00:00Z",
      to: "2014-08-01T00:00:00Z"
    }
  },
  sort: {
    field: "date",
    order: "asc",
    mode: "avg"
  }
}, function(err, res) {
  console.log(res);
});
```

### Examples

See [examples](https://github.com/tinysou/tinysou-node/tree/master/examples)

## Contributing

1. Fork it ( https://github.com/tinysou/tinysou-node/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
