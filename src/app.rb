require_relative "views/ruby2d"
require_relative "models/state"
require_relative "utils/initial_state"

view = View::Ruby2dView.new
state = initial_state()
view.render(state)
