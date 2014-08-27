{exec} = require 'child_process'
task 'build', 'Build project from src/*.coffee to lib/*.js', ->
  exec 'coffee --compile --output lib/ src/', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

task 'watch', 'Build project from src/*.coffee to lib/*.js and watch for changes', ->
  exec 'coffee --compile --watch --output lib/ src/', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr
