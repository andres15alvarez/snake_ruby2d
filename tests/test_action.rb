require_relative 'test_helper'
require_relative '../src/utils/initial_state'
require_relative '../src/models/state'
require_relative '../src/models/coordinate'
require_relative '../src/models/snake'
require_relative '../src/models/food'
require_relative '../src/models/grid'
require_relative '../src/utils/direction'
require_relative '../src/actions/actions'

# Test actions
class ActionTest < Minitest::Test
  def setup
    @state = initial_state
  end

  def test_move_snake
    expected_state = State.new(
      Snake.new([Coordinate.new(2, 1), Coordinate.new(1, 1)]),
      Food.new(4, 4),
      Grid.new(12, 15),
      Direction::DOWN
    )
    actual_state = move_snake(@state)
    assert_equal(expected_state, actual_state)
  end

  def test_move_snake_to_position
    expected_state = State.new(
      Snake.new([Coordinate.new(2, 1), Coordinate.new(1, 1)]),
      Food.new(4, 4),
      Grid.new(12, 15),
      Direction::DOWN
    )
    actual_state = move_snake_to_position(@state, Coordinate.new(2, 1))
    assert_equal(expected_state, actual_state)
  end

  def test_change_direction
    expected_state = State.new(
      Snake.new([Coordinate.new(1, 1), Coordinate.new(0, 1)]),
      Food.new(4, 4),
      Grid.new(12, 15),
      Direction::LEFT
    )
    actual_state = change_direction(@state, Direction::LEFT)
    assert_equal(expected_state.next_direction, actual_state.next_direction)
  end

  def test_change_direction_invalid
    expected_state = State.new(
      Snake.new([Coordinate.new(1, 1), Coordinate.new(0, 1)]),
      Food.new(4, 4),
      Grid.new(12, 15),
      Direction::DOWN
    )
    actual_state = change_direction(@state, Direction::UP)
    assert_equal(expected_state, actual_state)
  end

  def test_grow_snake
    initial_state = State.new(
      Snake.new([Coordinate.new(1, 1), Coordinate.new(0, 1)]),
      Food.new(2, 1),
      Grid.new(12, 15),
      Direction::DOWN
    )
    expected_snake = Snake.new([Coordinate.new(2, 1), Coordinate.new(1, 1), Coordinate.new(0, 1)])
    actual_state = move_snake(initial_state)
    assert_equal(expected_snake, actual_state.snake)
  end

  def test_end_game
    state = move_snake(@state)
    loop do
      state = move_snake(state)
      if state.is_game_finished
        break
      end
    end
    assert_equal(true, state.is_game_finished)
  end

  def test_calculate_next_position_up
    initial_state = State.new(
      Snake.new([Coordinate.new(1, 1), Coordinate.new(2, 1)]),
      Food.new(2, 1),
      Grid.new(12, 15),
      Direction::UP
    )
    next_position = calculate_next_position(initial_state)
    assert_equal(Coordinate.new(0, 1), next_position)
  end

  def test_calculate_next_position_left
    state = @state
    state.next_direction = Direction::LEFT
    next_position = calculate_next_position(state)
    assert_equal(Coordinate.new(1, 0), next_position)
  end

  def test_calculate_next_position_right
    state = @state
    state.next_direction = Direction::RIGHT
    next_position = calculate_next_position(state)
    assert_equal(Coordinate.new(1, 2), next_position)
  end

  def test_next_direction_up
    state = @state
    state.next_direction = Direction::UP
    is_valid = next_direction_valid?(state, Direction::LEFT)
    assert_equal(true, is_valid)
  end

  def test_next_direction_left
    state = @state
    state.next_direction = Direction::LEFT
    is_valid = next_direction_valid?(state, Direction::UP)
    assert_equal(true, is_valid)
  end

  def test_next_direction_rigth
    state = @state
    state.next_direction = Direction::RIGHT
    is_valid = next_direction_valid?(state, Direction::UP)
    assert_equal(true, is_valid)
  end
end
