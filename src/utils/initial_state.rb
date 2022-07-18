require_relative "../models/state"
require_relative "../models/coordinate"
require_relative "../models/snake"
require_relative "../models/food"
require_relative "../models/grid"
require_relative "direction"

def initial_state
  State.new(
    Snake.new([Coordinate.new(1, 1), Coordinate.new(0, 1)]),
    Food.new(4, 4),
    Grid.new(12, 15),
    Direction::DOWN
  )
end
