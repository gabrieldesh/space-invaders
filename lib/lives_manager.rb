require_relative 'base_component'

class LivesManager < BaseComponent

    def initialize window
        @lives_image = Array.new
        3.times { @lives_image << Gosu::Image.new( "assets/cannon.png") }
        
        super window, 20, window.height - @lives_image[0].height * DRAW_SCALE
    end

    def update
    end

    def remove_live
        @lives_image.pop
    end

    def number_of_lives
        @lives_image.length
    end
    
    def draw
        for index in 0..number_of_lives - 1
            @lives_image[index].draw(@x + index *  @lives_image[index].width * DRAW_SCALE, @y, 0, scale_x = DRAW_SCALE, scale_y = DRAW_SCALE, color = Gosu::Color::WHITE)
        end
    end
end