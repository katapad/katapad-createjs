#Function::property = (prop, desc) ->
#  Object.defineProperty @prototype, prop, desc

###
 papervision3DのFreeCamaeraもどき。2Dで実行する。

 @usage
 <ol>
   <li>cameraをnewして被写体となるDisplayObjectを登録する</li>
   <li>cameraインスタンスをaddChildすると、noRenderモードでどんなカメラの画角なのかが見れるようになる</li>
   <li>cameraOnにしてcameraをTween等で適当に動かすと見れるようになる。</li>
 </ol>
 <pre>
    @_camera = new FreeCamera(cameraTarget, width, height)
    @_camera.cameraOn()
    # for debug
#    container.addChild @_camera
#    @_camera.setScale 0.15
#    @_camera.zoom = 6.7
#    @_camera.setIsNoRender true
#    @_camera.visible = true
 </pre>
###
class FreeCamera extends createjs.Shape

  _stage: null
  _stageW: 0
  _stageH: 0
  _target: null
  _isNoRender: false
  _scale: 1.0
  _targetMatrix: null
  _rect: null


  ###
  @params target:DisplayObject
  ###
  constructor: (@_target, @_stageW, @_stageH) ->
    @initialize()

    @_targetMatrix = new createjs.Matrix2D()
    @_stage = @_target.stage
    @_scale = 1.0

    @_halfW = @_stageW >> 1
    @_halfH = @_stageH >> 1
    @visible = false

    @_createShape()

    @_rect = new createjs.Rectangle()
    @updateRegion()

  ###
  zoom率の指定
  ###
  Object.defineProperties @prototype,
    zoom:
      get: ->
        1 / @_scale
      set: (value) ->
        @scaleX = @scaleY = @_scale = 1 / value
        @updateRegion()


  cameraOn: ()->
    createjs.Ticker.addEventListener('tick', @_render)

  cameraOff: ()->
    createjs.Ticker.removeEventListener('tick', @_render)




  _createShape: ->
    @graphics.setStrokeStyle(1).beginStroke('#FF0000')
      .drawRect(-@_halfW, -@_halfH, @_stageW, @_stageH)


  _render: ()=>
    if (@_isNoRender)
      return

    @scaleX = @scaleY = @_scale
    thisMatrix = @getMatrix()
    @_targetMatrix.identity()
    thisMatrix.invert()
    thisMatrix.appendMatrix @_targetMatrix
    thisMatrix.decompose @_target


  getScale: =>
    @_scale

  setScale: (value)=>
    @scaleX = @scaleY = @_scale = value

  getRegion: ->
    @updateRegionXY()
    @_rect

  updateRegionXY: ->

    @_rect.x = @x
    @_rect.y = @y
    @_rect.left = @x
    @_rect.top = @y
#    @_rect.left = @x - @_rect.width * 0.5
#    @_rect.top = @y - @_rect.height * 0.5
    @_rect.right = @_rect.left + @_rect.width
    @_rect.bottom = @_rect.top + @_rect.height

  updateRegion: ->
    mtx = @getMatrix()
    @_rect.width = @_stageW * mtx.a
    @_rect.height = @_stageH * mtx.d
    @updateRegionXY()



#  setZoom: (value)->
#    @setScale 1 / value
#
#  getZoom: ->
#    1 / @_scale

  getIsNoRender: ->
    @_isNoRender

  setIsNoRender: (value)->
    @_isNoRender = value






module.exports = exports = FreeCamera