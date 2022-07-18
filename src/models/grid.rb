# Grid with number of rows and columns
# @!attribute [rw] rows
#   @return [Integer] number of rows in the grid
# @!attribute [rw] cols
#   @return [Integer] number of columns in the grid
class Grid
  attr_accessor :rows, :cols

  # @param rows [Integer] number of rows in the grid
  # @param cols [Integer] number of columns in the grid
  def initialize(rows, cols)
    @rows = rows
    @cols = cols
  end

  # @param other [Grid] object to compare
  # @return [Boolean] if the two object are equal
  def ==(other)
    @rows == other.rows and @cols == other.cols
  end
end
