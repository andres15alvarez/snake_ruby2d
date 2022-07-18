class State
  attr_accessor :snake, :food, :grid, :next_direction, :is_game_finished
  def initialize(snake, food, grid, next_direction)
    @snake = snake
    @food = food
    @grid = grid
    @next_direction = next_direction
    @is_game_finished = false
  end

  def ==(other)
    (
      @snake == other.snake and
      @food == other.food and
      @grid == other.grid and
      @is_game_finished == other.is_game_finished
    )
  end
end
