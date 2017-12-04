fs = require 'fs'
path = require 'path'


controllers = {}

fs.readdirSync(__dirname).filter((file) ->
  file.indexOf('.') != 0 and file != 'index.coffee'
).forEach (file) ->
  name = file.replace '.coffee', ''
  controllers[name] = require "./#{file}"

module.exports = controllers
