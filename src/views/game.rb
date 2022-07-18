require 'ruby2d'
require_relative '../actions/actions'
require_relative '../utils/handle_input'

# Main view of the game
class GameView
  # @param app [App]
  def initialize(app)
    @pixel_size = 50
    @app = app
  end

  # @param state [State]
  def start(state)
    extend Ruby2D::DSL
    set(
      title: 'Snake',
      width: @pixel_size * state.grid.cols,
      height: @pixel_size * state.grid.rows
    )
    on :key_down do |event|
      @app.send_action(:change_direction, handle_input(event.key))
    end
    show
  end

  # @param state [State]
  def render_game(state)
    extend Ruby2D::DSL
    close if state.is_game_finished
    render_snake(state)
    render_food(state)
  end

  private

  # @param state [State]
  def render_food(state)
    @food&.remove
    extend Ruby2D::DSL
    @food = Square.new(
      x: state.food.col * @pixel_size,
      y: state.food.row * @pixel_size,
      size: @pixel_size,
      color: 'orange'
    )
  end

  # @param state [State]
  def render_snake(state)
    @snake_positions&.each(&:remove)
    extend Ruby2D::DSL
    @snake_positions = state.snake.positions.map do |pos|
      Square.new(
        x: pos.col * @pixel_size,
        y: pos.row * @pixel_size,
        size: @pixel_size,
        color: 'green'
      )
    end
  end
end
