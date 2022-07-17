class State
  attr_accessor :snake, :food, :grid
  def initialize(snake, food, grid)
    @snake = snake
    @food = food
    @grid = grid
  end
end
