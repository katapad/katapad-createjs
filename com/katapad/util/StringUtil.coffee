class StringUtil

  @zeroPadding: (value, size = 2)->
    result = value.toString(10)
    while (result.length < size)
      result = "0" + result
    return result

module.exports = exports = StringUtil