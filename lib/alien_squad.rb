require_relative 'alien'
require_relative 'base_component'

class AlienSquad < BaseComponent

    NUMBER_OF_LINES = 5
    NUMBER_OF_COL = 7
    VERTICAL_DISTANCE = 50
    HORIZONTAL_DISTANCE = 40

    X_SPEED = 1
    Y_SPEED = 10

    def initialize (window)
        super window, 0, 100

        @aliens = []
        @moving_direction = :right
        
        create_aliens

        @alien_width  = first_alien_width
        @alien_height = first_alien_height
    end

    def width
        HORIZONTAL_DISTANCE * NUMBER_OF_COL + @alien_width
    end
    
    def height
        VERTICAL_DISTANCE * NUMBER_OF_LINES + @alien_height
    end
    
    def draw 
        for alien in @aliens
                alien.draw
        end
    end

    def update
        case @moving_direction
        when :right
          if @x < @window.width - width
            move_right
          else
            move_down
            @moving_direction = :left
          end
        when :left
          if @x > 0
            move_left
          else
            move_down
            @moving_direction = :right
          end
        end
    end

    private
    def create_aliens
        for line in 0..NUMBER_OF_LINES
            for column in 0..NUMBER_OF_COL
                @aliens << Alien.new(@window, @x + HORIZONTAL_DISTANCE * column, @y + VERTICAL_DISTANCE * line)
            end  
        end
    end
    
    def first_alien_width
        @aliens[0].width
    end

    def first_alien_height
        @aliens[0].height
    end

    def move_left
        for alien in @aliens
            alien.move_left X_SPEED
        end
        @x -= X_SPEED
    end
      
    def move_right
        for alien in @aliens
            alien.move_right X_SPEED
        end
        @x += X_SPEED
    end
      
    def move_down
        for alien in @aliens
            alien.move_down Y_SPEED
        end
        @y += Y_SPEED
    end
end