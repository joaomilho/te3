class RandomBlock
  Array.prototype.sample = ->
    this[Math.floor Math.random() * this.length]

  @blocks: [BlockE, BlockI, BlockL, BlockLV, BlockO]

  @choose: ->
    blockClass = @blocks.sample()
    new blockClass
