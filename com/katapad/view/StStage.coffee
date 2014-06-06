_hash = {}

class StStage
  @init: (@stage)->


  @add: (id, stage)->
    _hash[id] = stage

  @get: (id)->
    _hash[id]

module.exports = exports = StStage