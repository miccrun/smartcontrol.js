controllers = require './controllers'


module.exports = (app, controller) ->
  app.post '/api/v1/device/:deviceId', controllers.device.control
  app.post '/api/v1/sensor/:sensorId', controllers.sensor.set
