class MCUtil

  ###*
  Change scale shorthand
  ###
  @scale: (mc, scale)->
    mc.scaleX = mc.scaleY = scale

  @show: (mc)->
    mc.visible = true
    mc.alpha = 1

  @hide: (mc)->
    mc.visible = false
    mc.alpha = 0


module.exports = exports = MCUtil