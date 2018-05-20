class BaseComponent

    DRAW_SCALE = 3

    attr_reader :x, :y

    def initialize(window, x = 0, y = 0)
        @window = window
        @x = x
        @y = y
        @remove = false
    end
    
    def update
        raise NotImplementedError
    end

    def draw
       raise NotImplementedError
    end
end