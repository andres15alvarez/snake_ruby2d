require_relative 'direction'

# Handle the keyboard input of the user
# @param key [String] the name of the key pressed
# @return [Symbol] symbol representing the key pressed
def handle_input(key)
  case key
  when 'up'
    Direction::UP
  when 'down'
    Direction::DOWN
  when 'left'
    Direction::LEFT
  when 'right'
    Direction::RIGHT
  end
end
