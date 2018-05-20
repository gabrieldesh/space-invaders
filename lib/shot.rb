require_relative 'base_component'

class Shot < BaseComponent

    DIRECTIONS = { up: -1, down: 1 }

    def initialize window, image_component, direction
        super window, image_component.x + image_component.width / 2, image_component.y

        @direction = direction
        @width = 2  # this is actually 1/2 of width
        @height = 20
        @speed = 10.0
        # @snd_frequency = 0.15
        # @snd_volume = 2.0
        @color1 = Gosu::Color.new(0xffd936f1)
        @color2 = Gosu::Color.new(0xff000000)
        # @snd = self.class.load_sound(@window)
        # @muted = false
    end

    def update
        if  @y > 0.0 || @y < @window.height
            @y += DIRECTIONS[@direction] * @speed
        else 
            @remove = true
        end
    end
      
    def draw    
        @window.draw_quad(@x - @width, @y, @color1, 
                          @x + @width, @y, @color1, 
                          @x - @width, @y + @height, @color2, 
                          @x + @width, @y + @height, @color2, 
                          2)
    end

    def collide?(thing)
        (Gosu::distance(@x , @y, thing.x + thing.width / 2, thing.y + thing.height / 2 ) < thing.radius) 
    end
end