bodyParser = require 'body-parser'
compress = require 'compression'
express = require 'express'
morgan = require 'morgan'
methodOverride = require 'method-override'

config = require './config'

module.exports = (app) ->
  app.set 'port', config.PORT
  app.use morgan 'combined'
  app.use do compress
  app.use do methodOverride
  app.use do bodyParser.json
  app.use bodyParser.urlencoded
    extended: yes
