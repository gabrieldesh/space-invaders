require_relative 'base_component'

module lifesManager
    include BaseComponent

    def new window
        lifes_image = Array.new
        3.times { lifes_image << Gosu::Image.new( "assets/cannon.png") }
        
        BaseComponent.new window, 20, window.height - lifes_image[0].height * DRAW_SCALE
    end
    module_function :new

    def update
    end

    def remove_life
        @lifes_image.pop
    end

    def number_of_lifes
        @lifes_image.length
    end
    
    def draw
        for index in 0..number_of_lifes - 1
            @lifes_image[index].draw(@x + index *  @lifes_image[index].width * DRAW_SCALE, @y, 0, scale_x = DRAW_SCALE, scale_y = DRAW_SCALE, color = Gosu::Color::WHITE)
        end
    end
end