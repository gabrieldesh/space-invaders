require_relative 'image_component'

module Alien
  include ImageComponent

  attr_reader :points

  def new(window, x, y, points, path_image)
    ImageComponent.new window, x, y, path_image
    points = points
  end
  module_function :new

end