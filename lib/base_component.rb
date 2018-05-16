class BaseComponent

    DRAW_SCALE = 3

    attr_writer :remove
    attr_reader :x, :y


    def initialize(window, x = 0, y = 0)
        @window = window
        @x = x
        @y = y
        @remove = false
    end

    def warp(x, y)
        @x, @y = x, y
    end

    
    def remove?
        @remove
    end
    
    def update
        raise NotImplementedError
     end

    def draw
       raise NotImplementedError
    end

    def collide?(thing)
        (Gosu::distance(@x , @y, thing.x + thing.width / 2, thing.y + thing.height / 2 ) < thing.radius) 
    end
end