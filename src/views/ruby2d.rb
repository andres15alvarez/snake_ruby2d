require "ruby2d"

module View
  class Ruby2dView

    def initialize
    end

    def render(state)
      extend Ruby2D::DSL
      set(title: "Snake", width: 900, height: 600)
      show
    end

  end
end
