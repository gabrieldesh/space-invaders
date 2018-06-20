require_relative 'base_component'

module FontComponent
    include BaseComponent
    
    def new(window, x, y)
        BaseComponent.new window, x, y
        font =  Gosu::Font.new(window, "assets/spaceranger.ttf", 14)
    end
    module_function :new

    def draw text
        @font.draw(text, @x, @y, 0, scale_x = DRAW_SCALE, scale_y = DRAW_SCALE)
    end

end