# State of the game.
# This class include the snake, food and grid obejects.
# @!attribute [rw] snake
#   @return [Snake] snake object
# @!attribute [rw] food
#   @return [Food] food object
# @!attribute [rw] grid
#   @return [Grid] grid object
# @!attribute [rw] next_direction
#   @return [Direction] direction symbol where the snake is going to
# @!attribute [rw] is_game_finished
#   @return [Boolean] if the game has finished
class State
  attr_accessor :snake, :food, :grid, :next_direction, :is_game_finished

  # @param snake [Snake] snake object.
  # @param food [Food] food object.
  # @param grid [Grid] grid object.
  # @param next_direction [Direction] direction symbol where the snake is going to
  def initialize(snake, food, grid, next_direction)
    @snake = snake
    @food = food
    @grid = grid
    @next_direction = next_direction
    @is_game_finished = false
  end

  # @param other [State] object to compare
  # @return [Boolean] if the two object are equal
  def ==(other)
    (
      @snake == other.snake and
      @food == other.food and
      @grid == other.grid and
      @is_game_finished == other.is_game_finished
    )
  end
end
