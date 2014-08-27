assert = require 'assert'
Tinysou = require '../lib/tinysou'


describe 'Tinysou', ->
  it 'should have a config', ->
    tinysou = new Tinysou 'token'
    assert.equal 'token', tinysou.token
