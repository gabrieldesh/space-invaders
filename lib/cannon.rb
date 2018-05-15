require 'gosu'

class Cannon

  attr_reader :x, :y
  STEP_MOVEMENT = 1.5
  
  def initialize
    @image = Gosu::Image.new("assets/cannon.png")
    @x = @y = 0.0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def move 
    if left_key_pressed?
      move_left
    end
    if right_key_pressed?
      move_right
    end
  end

  def draw
    @image.draw(@x, @y, @z, scale_x = 3, scale_y = 3)
  end

 private
  def left_key_pressed?
    Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
  end

  def right_key_pressed?
    Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
  end

  def move_left
      @x -= STEP_MOVEMENT
  end

  def move_right
      @x += STEP_MOVEMENT
  end
end