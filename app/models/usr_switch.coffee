net = require 'net'


class USRSwitch
  constructor: (@host, @port) ->

  parseResult: (data, cb) ->
    hexString = data.toString 'hex'
    cb null, hexString.substr hexString.length - 4, 2

  sendCommand: (command, cb) ->
    client = new net.Socket
    client.setTimeout 3000
    client.connect @port, @host, ->
      client.write new Buffer command, 'hex'

    client.on 'data', (data) =>
      @parseResult data, cb
      do client.destroy

    client.on 'error', (err) ->
      cb err.code
      do client.destroy

    client.on 'timeout', (err) ->
      cb 'TIMEOUT'
      do client.destroy

  on: (cb) ->
    @sendCommand '55AA000300020106', cb

  off: (cb) ->
    @sendCommand '55AA000300010105', cb

  status: (cb) ->
    @sendCommand '55AA0002000a0c', cb


module.exports = USRSwitch
