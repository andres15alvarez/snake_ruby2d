require "ruby2d"

class Ruby2dView

  def initialize
    @pixel_size = 50
  end

  def render(state)
    extend Ruby2D::DSL
    set(
      title: "Snake",
      width: @pixel_size * state.grid.cols,
      height: @pixel_size * state.grid.rows
    )
    render_snake(state)
    render_food(state)
    show
  end

  private

  def render_food(state)
    extend Ruby2D::DSL
    Square.new(
      x: state.food.col * @pixel_size,
      y: state.food.row * @pixel_size,
      size: @pixel_size,
      color: 'orange'
    )
  end

  def render_snake(state)
    extend Ruby2D::DSL
    state.snake.positions.each do |pos|
      Square.new(
        x: pos.col * @pixel_size,
        y: pos.row * @pixel_size,
        size: @pixel_size,
        color: 'green'
      )
    end
  end

end
