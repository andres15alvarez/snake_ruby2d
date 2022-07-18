class Coordinate
  attr_accessor :row, :col
  def initialize(row, col)
    @row = row
    @col = col
  end

  def ==(other)
    @row == other.row and @col == other.col
  end
end
