require_relative 'image_component'

class Alien < ImageComponent
  
  def initialize window, x, y
    super window, x, y, "assets/alien.png"
  end

  def update
    @x += 1
  end
end