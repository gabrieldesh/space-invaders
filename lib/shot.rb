require_relative 'base_component'

class Shot < BaseComponent

    def initialize(window, x, y, color1 = 0xffd936f1, color2 = 0xff000000, alien)
        super window, x, y
        @alien = alien
        @width = 2  # this is actually 1/2 of width
        @height = 20
        @speed = 10.0
        # @snd_frequency = 0.15
        # @snd_volume = 2.0
        @color1 = Gosu::Color.new(color1)
        @color2 = Gosu::Color.new(color2)
        # @snd = self.class.load_sound(@window)
        # @muted = false
    end

    def update
        if collide?(@alien)
            @remove = true
            @alien.remove = true
        end

        if  @y > 0.0
            @y -= @speed
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
end