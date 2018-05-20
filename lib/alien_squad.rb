require_relative 'alien'
require_relative 'base_component'

class AlienSquad < BaseComponent

    NUMBER_OF_LINES = 5
    NUMBER_OF_COL = 7
    VERTICAL_DISTANCE = 50
    HORIZONTAL_DISTANCE = 40

    X_SPEED = 1
    Y_SPEED = 10

    attr_reader :aliens

    def initialize window
        super window, 0, 100
        @moving_direction = :right
        
        create_aliens
    end
    
    def draw 
        for alien in @aliens
            alien.draw
        end
    end

    def update
        case @moving_direction
            when :right
                if border_right < @window.width - @aliens[0].width
                    move_right
                else
                    move_down
                    @moving_direction = :left
                end
            when :left
                if border_left > 0
                    move_left
                else
                    move_down
                    @moving_direction = :right
                end
        end
    end

    def get_random_alien
        @aliens[rand(@aliens.length).to_i]
    end

    private

    def create_aliens
        @aliens = []
        for line in 0..NUMBER_OF_LINES
            for column in 0..NUMBER_OF_COL
                @aliens << Alien.new(@window, @x + HORIZONTAL_DISTANCE * column, @y + VERTICAL_DISTANCE * line)
            end  
        end
    end
    
    def border_left
        @aliens.min_by { |a| a.x }.x
    end

    def border_right
        @aliens.max_by { |a| a.x }.x
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