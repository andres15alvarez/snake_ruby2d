class Grid
  attr_accessor :rows, :cols
  def initialize(rows, cols)
    @rows = rows
    @cols = cols
  end

  def ==(other)
    @rows == other.rows and @cols == other.cols
  end
end
