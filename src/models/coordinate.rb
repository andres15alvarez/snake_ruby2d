# Coordinate with row and column values
# @!attribute [rw] row
#   @return [Integer] value of the row in the grid
# @!attribute [rw] col
#   @return [Integer] value of the column in the grid
class Coordinate
  attr_accessor :row, :col

  # @param row [Integer] value of the row in the grid
  # @param col [Integer] value of the column in the grid
  def initialize(row, col)
    @row = row
    @col = col
  end

  # @param other [Coordinate] object to compare
  # @return [Boolean] if the two object are equal
  def ==(other)
    @row == other.row and @col == other.col
  end
end
