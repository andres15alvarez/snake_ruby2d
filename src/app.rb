require_relative 'views/game'
require_relative 'models/state'
require_relative 'utils/initial_state'
require_relative 'actions/actions'

# Entry point of the game
class App
  def initialize
    @state = initial_state
  end

  def start
    @view = GameView.new(self)
    Thread.new { init_timer(@view) }
    @view.start(@state)
    @view.render_game(@state)
  end

  def init_timer(view)
    loop do
      if @state.is_game_finished
        break
      end
      @state = move_snake(@state)
      view.render_game(@state)
      sleep 0.5
    end
  end

  def send_action(action, params)
    new_state = method(action).call(@state, params)
    if new_state.hash != @state.hash
      @state = new_state
      @view.render(@state)
    end
  end
end

app = App.new
app.start
