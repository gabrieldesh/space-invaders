require 'gosu'

class Cannon

  attr_reader :x, :y

  STEP_MOVEMENT = 1.5
  DRAW_SCALE = 3
  
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

  def width
    @image.width * DRAW_SCALE
  end

  def draw
    @image.draw(@x, @y, 0, scale_x = DRAW_SCALE, scale_y = DRAW_SCALE)
  end

 private
  def left_key_pressed?
    Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
  end

  def right_key_pressed?
    Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
  end

  def move_left
    if @x > 0
      @x -= STEP_MOVEMENT
    end
  end

  def move_right
    if @x < 800 - width
      @x += STEP_MOVEMENT
    end
  end
end