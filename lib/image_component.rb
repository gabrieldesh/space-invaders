require_relative 'base_component'

class ImageComponent < BaseComponent
    
    def initialize (window, x = 0, y = 0, image_path)
        @image = Gosu::Image.new(image_path)
        super window, x, y
    end

    def height
        @image.height * DRAW_SCALE
    end

    def width
        @image.width * DRAW_SCALE
    end

    def draw
        @image.draw(@x, @y, 0, scale_x = DRAW_SCALE, scale_y = DRAW_SCALE)
    end
end