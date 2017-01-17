class Cell
  attr_reader :alive

  def initialize(alive = false)
    @alive = alive
  end

  def alive?
    alive
  end

  def dead?
    !alive?
  end

  def alive!
    @alive = true
  end

  def dead!
    @alive = false
  end

  ##
  # If both the neighbors are alive, they considered equal
  def ==(neighbor)
    alive? == neighbor.alive?
  end
end