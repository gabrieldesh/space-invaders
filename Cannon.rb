require 'gosu'

class Cannon
    def initialize
      @image = Gosu::Image.new("cannon.png")
      @x = @z = @vel_x = @vel_y = @angle = 0.0
      @score = 0
    end
  
    def warp(x, y)
      @x, @y = x, y
    end

    def move_left
        @x -= 1.5
    end

    def move_right
        @x += 1.5
    end
    
    def accelerate
      @vel_x += Gosu.offset_x(@angle, 0.5)
      @vel_y += Gosu.offset_y(@angle, 0.5)
    end
    
    def move
      @x += @vel_x
      @y += @vel_y
      @x %= 640
      @y %= 480
      
      @vel_x *= 0.95
      @vel_y *= 0.95
    end
  
    def draw
      @image.draw(@x, @y, @z, scale_x = 0.5, scale_y = 0.5)
    end
  end