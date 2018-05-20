class BaseComponent

    DRAW_SCALE = 3
    DIRECTIONS = { up: -1, down: 1, right: 1, left: -1 }

    attr_reader :x, :y

    def initialize(window, x = 0, y = 0)
        @window = window
        @x = x
        @y = y
        @remove = false
    end

    def move direction, displacement
        if direction == :right || direction == :left
          @x += DIRECTIONS[direction] * displacement
        elsif direction == :down || direction == :up
          @y += DIRECTIONS[direction] * displacement
        end
    end
    
    def update
        raise NotImplementedError
    end

    def draw
       raise NotImplementedError
    end
end