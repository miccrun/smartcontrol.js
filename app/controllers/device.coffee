module.exports =
  control: (req, res, next) ->
    console.log req.body
    res.status(200).json
      status: 'ok'
