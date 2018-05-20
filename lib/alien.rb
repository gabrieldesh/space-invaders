require_relative 'image_component'

class Alien < ImageComponent

  attr_reader :points

  def initialize window, x, y, points, path_image
    super window, x, y, path_image
    @points = points
  end

end