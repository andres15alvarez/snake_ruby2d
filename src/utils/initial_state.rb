require_relative "../models/state"
require_relative "../models/coordinate"
require_relative "../models/snake"
require_relative "../models/food"
require_relative "../models/grid"

def initial_state
  State.new(
    Snake.new([Coordinate.new(1, 1), Coordinate.new(0,1)]),
    Food.new(4, 4),
    Grid.new(8, 12)
  )
end
