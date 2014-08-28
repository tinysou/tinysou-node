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
  name: 'post',
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
tinysou.collections.get('blog', 'post', function(err, rest) {
  console.log(res);
});
```

Delete

```javascript
tinysou.collections.delete('blog', 'post', function(err, res) {
  console.log(res);
});
```

#### Document

List

```javascript
tinysou.documents.list('blog', 'post', function(err, res) {
  console.log(res);
});
```

Create

```javascript
tinysou.documents.create('blog', 'post', {
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
tinysou.documents.get('blog', 'post', '293ddf9205df9b36ba5761d61ca59a29', function(err, res) {
  console.log(res);
});
```

Update

```javascript
tinysou.documents.update('blog', 'post', '293ddf9205df9b36ba5761d61ca59a29', {
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
tinysou.documents.delete('blog', 'post', '293ddf9205df9b36ba5761d61ca59a29', function(err, res) {
  console.log(res);
});
```

####Search

Search in one collection

```javascript
tinysou.search.single('blog', 'post', {
  p: 'tinysou',
  page: '1',
  per_parge: '10',
  sort:{
    field: "date",
    order: "asc",
    mode: "avg"
  }
}, function(err, res) {
  console.log(res);
});
```

Search in collections

```javascript
tinysou.search.many('blog', {
  q: 'tinysou',
  c: 'post, document'
  page: '1',
  per_parge: '10',
  sort:{
    field: "date",
    order: "asc",
    mode: "avg"
  }
}, function(err, res) {
  console.log(res);
});
```

### Example

See [demo.coffee](examples/demo.coffee) and [demo.js](examples/demo.js).
