require_relative 'base_component'

module ImageComponent
    include BaseComponent
    
    def new(window, x = 0, y = 0, image_path)
        image = Gosu::Image.new(image_path)
        BaseComponent.new window, x, y
    end
    module_function :new

    def radius
        20
    end

    def height(image)
        image.height * DRAW_SCALE
    end
    module_function :height

    def width(image)
        image.width * DRAW_SCALE
    end
    module_function :width

    def draw
        @image.draw(@x, @y, 0, scale_x = DRAW_SCALE, scale_y = DRAW_SCALE)
    end
end