require_relative 'base_component'

class FontComponent < BaseComponent
    
    def initialize window, x, y
        super window, x, y
        @font =  Gosu::Font.new(window, "assets/spaceranger.ttf", 14)
    end

    def draw text
        @font.draw(text, @x, @y, 0, scale_x = DRAW_SCALE, scale_y = DRAW_SCALE)
    end

end