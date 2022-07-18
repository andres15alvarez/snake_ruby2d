require_relative "direction"

def handle_input(key)
  case key
  when "up"
    Direction::UP
  when "down"
    Direction::DOWN
  when "left"
    Direction::LEFT
  when "right"
    Direction::RIGHT
  end
end
