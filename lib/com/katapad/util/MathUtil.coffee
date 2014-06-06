class MathUtil

  ###
  範囲内での乱数を生成します。value 2なら　-2～2を返します。
  @param	value 2なら　-2～2を返します。
  @return 	範囲内の乱数
  ###
  @range: (min, max)->
    return Math.random() * (max - min) + min


  @randomFromArray: (array)->
    return array[Math.floor(Math.random() * array.length)]

  ###
  度→ラジアン の変換
  @param	degree
  ###
  @degreeToRadian:(degree) ->
    return degree * Math.PI / 180

  ###
  ラジアン → 度 の変換
  @param	degree
  ###
  @raidanToDegree:(raidan) ->
    return raidan / Math.PI * 180

  ###
  1か-1を返します
  ###
  @getCoin:(raidan) ->
    return if Math.random() > .5 then 1 else -1

module.exports = exports = MathUtil