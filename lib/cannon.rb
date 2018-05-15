require 'gosu'

class Cannon

  attr_reader :x, :y
  STEP_MOVEMENT = 1.5
  
  def initialize
    @image = Gosu::Image.new("assets/cannon.png")
    @x = @z = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def move 
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      move_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      move_right
    end
  end

  def draw
    @image.draw(@x, @y, @z, scale_x = 3, scale_y = 3)
  end

 private
  def move_left
      @x -= STEP_MOVEMENT
  end

  def move_right
      @x += STEP_MOVEMENT
  end
end