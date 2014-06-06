class Square extends createjs.Shape
  constructor: (width, height, color) ->
    @initialize()
    @graphics.beginFill(color).drawRect(0, 0, width, height)



module.exports = exports = Square