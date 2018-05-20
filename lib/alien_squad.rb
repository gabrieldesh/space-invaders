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
        super window, 0, 0
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
                    move :right, X_SPEED
                else
                    move :down, Y_SPEED
                    @moving_direction = :left
                end
            when :left
                if border_left > 0
                    move :left, X_SPEED
                else
                    move :down, Y_SPEED
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

    def move direction, speed
        for alien in @aliens
            alien.move direction, speed
        end

        super direction, speed
    end
end