class Snake
  attr_accessor :positions

  def initialize(positions)
    @positions = positions
  end

  def ==(other)
    @positions == other.positions
  end
end
