require_relative 'image_component'

class Alien < ImageComponent
  
  def initialize window, x, y
    super window, x, y, "assets/alien.png"
  end

  def move_right displacement
    @x += displacement
  end

  def move_left displacement
    @x -= displacement
  end

  def move_down displacement
    @y += displacement
  end

  def update
    @x += 1
  end
end