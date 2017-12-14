USRSwitch = require './models/usr_switch'

holidayLight = new USRSwitch '192.168.29.113', 8899
decorationLight = new USRSwitch '192.168.29.114', 8899

module.exports = (app, controller) ->
  app.post '/api/holiday_light', (req, res, next) ->
    if req.body.active
      holidayLight.on ->
        res.send 'OK'
    else
      holidayLight.off ->
        res.send 'OK'
  app.get '/api/holiday_light', (req, res, next) ->
    holidayLight.status (err, status) ->
      if status == "01"
        res.send {
          is_active: true
        }
      else
        res.send {
          is_active: false
        }

  app.post '/api/decoration_light', (req, res, next) ->
    if req.body.active
      decorationLight.on ->
        res.send 'OK'
    else
      decorationLight.off ->
        res.send 'OK'
  app.get '/api/decoration_light', (req, res, next) ->
    decorationLight.status (err, status) ->
      if status == "01"
        res.send {
          is_active: true
        }
      else
        res.send {
          is_active: false
        }
