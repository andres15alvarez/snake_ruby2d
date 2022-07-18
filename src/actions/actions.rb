require_relative "../utils/direction"
require_relative "../models/coordinate"

def move_snake(state)
  next_direction = state.next_direction
  next_position = calculate_next_position(state)
  if is_position_valid?(state, next_position)
    move_snake_to_position(state, next_position)
  else
  end_game(state)
  end
end

def calculate_next_position(state)
  new_position = state.snake.positions.first
  case state.next_direction
  when Direction::UP
    return Coordinate.new(new_position.row - 1, new_position.col)
  when Direction::RIGHT
    return Coordinate.new(new_position.row, new_position.col + 1)
  when Direction::DOWN
    return Coordinate.new(new_position.row + 1, new_position.col)
  when Direction::LEFT
    return Coordinate.new(new_position.row, new_position.col - 1)
  end
end

def is_position_valid?(state, position)
  is_inside_grid = (
    (position.row < state.grid.rows and position.row >= 0) and
    (position.col < state.grid.cols and position.col >= 0)
  )
  is_snake_position = state.snake.positions.include?(position)
  is_inside_grid and not is_snake_position
end

def move_snake_to_position(state, position)
  new_positions = [position] + state.snake.positions[0...-1]
  state.snake.positions = new_positions
  state
end

def end_game(state)
  state.is_game_finished = true
  state
end
