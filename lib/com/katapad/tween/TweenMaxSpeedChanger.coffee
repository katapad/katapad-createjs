class TweenMaxSpeedChanger
  @init: ->

    window.addEventListener('keydown', (e)->
      switch e.keyCode
        # 1だったら等速
        when 49
          TweenMax.globalTimeScale(1)
        # 5だったら5倍速
        when 53
          TweenMax.globalTimeScale(5)
        # 9だったら55倍速
        when 57
          TweenMax.globalTimeScale(55)

    )

module.exports = exports = TweenMaxSpeedChanger 