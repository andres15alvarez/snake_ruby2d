require_relative '../utils/direction'
require_relative '../models/coordinate'
require_relative '../models/food'

# Move the snake updating the state of the game
# @param state [State]
# @return [State]
def move_snake(state)
  next_position = calculate_next_position(state)
  if position_food?(state, next_position)
    state = grow_snake_to(state, next_position)
    generate_food(state)
  elsif position_valid?(state, next_position)
    move_snake_to_position(state, next_position)
  else
    end_game(state)
  end
end

# @param state [State]
# @return [State]
def calculate_next_position(state)
  new_position = state.snake.positions.first
  case state.next_direction
  when Direction::UP
    Coordinate.new(new_position.row - 1, new_position.col)
  when Direction::RIGHT
    Coordinate.new(new_position.row, new_position.col + 1)
  when Direction::DOWN
    Coordinate.new(new_position.row + 1, new_position.col)
  when Direction::LEFT
    Coordinate.new(new_position.row, new_position.col - 1)
  end
end

# @param state [State]
# @param position [Coordinate]
# @return [Boolean]
def position_valid?(state, position)
  is_inside_grid = (
    (position.row < state.grid.rows and position.row >= 0) and
    (position.col < state.grid.cols and position.col >= 0)
  )
  is_snake_position = state.snake.positions.include?(position)
  is_inside_grid and !is_snake_position
end

# @param state [State]
# @param position [Coordinate]
# @return [State]
def move_snake_to_position(state, position)
  new_positions = [position] + state.snake.positions[0...-1]
  state.snake.positions = new_positions
  state
end

# @param state [State]
# @param direction [Direction]
# @return [Boolean]
def next_direction_valid?(state, direction)
  case state.next_direction
  when Direction::UP
    return true if direction != Direction::DOWN
  when Direction::DOWN
    return true if direction != Direction::UP
  when Direction::LEFT
    return true if direction != Direction::RIGHT
  when Direction::RIGHT
    return true if direction != Direction::LEFT
  end
end

# @param state [State]
# @param direction [Direction]
# @return [State]
def change_direction(state, direction)
  state.next_direction = direction if next_direction_valid?(state, direction)
  state
end

# @param state [State]
# @param next_position [Coordinate]
# @return [State]
def grow_snake_to(state, next_position)
  state.snake.positions = [next_position] + state.snake.positions
  state
end

# @param state [State]
# @param position [Coordinate]
# @return [Boolean]
def position_food?(state, position)
  state.food == position
end

# @param state [State]
# @return [State]
def generate_food(state)
  new_food = Food.new(rand(0...state.grid.rows), rand(0...state.grid.cols))
  state.food = new_food
  state
end

# @param state [State]
# @return [State]
def end_game(state)
  state.is_game_finished = true
  state
end
