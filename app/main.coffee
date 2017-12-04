express = require 'express'

config = require './config'

module.exports =
  start: (environment, port, cb) ->
    config.PORT = port if port?
    config.ENVIRONMENT = environment if environment?

    app = do express
    require('./middleware') app
    require('./routes') app
    @server = app.listen config.PORT, '0.0.0.0', ->
      console.log "#{new Date} Listening on port #{config.PORT} in #{config.ENVIRONMENT}"
      do cb if cb?

  stop: ->
    do @server?.close
