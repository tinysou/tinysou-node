tinysou-node
============

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
