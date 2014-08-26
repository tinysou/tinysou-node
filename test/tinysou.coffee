assert = require("assert")
Tinysou = require('../lib/tinysou')
describe 'Tinysou', ->
  describe 'init', ->
    it 'should have a config', ->
      tinysou = new Tinysou "key"
      assert.equal "key", tinysou.key
