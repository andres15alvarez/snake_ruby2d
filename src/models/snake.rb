# Snake object wiht an array of coordinates
# @!attribute [rw] positions
#   @return [Array<Coordinate>]
class Snake
  attr_accessor :positions

  # @param positions [Array<Coordinate>]
  def initialize(positions)
    @positions = positions
  end

  # @param other [Snake] object to compare
  # @return [Boolean] if the two object are equal
  def ==(other)
    @positions == other.positions
  end
end
