require "minitest/autorun"
require_relative "../src/utils/initial_state"
require_relative "../src/models/state"
require_relative "../src/models/coordinate"
require_relative "../src/models/snake"
require_relative "../src/models/food"
require_relative "../src/models/grid"
require_relative "../src/utils/direction"
require_relative "../src/actions/actions"

class ActionTest < Minitest::Test
  def test_move_snake
    state = initial_state()
    expected_state = State.new(
      Snake.new([Coordinate.new(2, 1), Coordinate.new(1, 1)]),
      Food.new(4, 4),
      Grid.new(12, 15),
      Direction::DOWN
    )
    actual_state = move_snake(state)
    assert_equal(expected_state, actual_state)
  end

  def test_move_snake_to_position
    state = initial_state()
    expected_state = State.new(
      Snake.new([Coordinate.new(2, 1), Coordinate.new(1, 1)]),
      Food.new(4, 4),
      Grid.new(12, 15),
      Direction::DOWN
    )
    actual_state = move_snake_to_position(state, Coordinate.new(2, 1))
    assert_equal(expected_state, actual_state)
  end
end
