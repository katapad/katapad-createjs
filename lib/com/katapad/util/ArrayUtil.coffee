class ArrayUtil

  @getRandomOne: (list)->
    list[Math.floor(list.length * Math.random())]

module.exports = exports = ArrayUtil