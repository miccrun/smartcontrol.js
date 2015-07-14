module.exports =
  set: (req, res, next) ->
    console.log req.body
    res.status(200).json
      status: 'ok'
