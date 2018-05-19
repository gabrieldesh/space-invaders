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

    def initialize (window)
        super window, 0, 100

        @aliens = []
        @moving_direction = :right
        
        create_aliens
    end

    def width
        @aliens.sort_by { |a| a.x }.reverse!
        first_alien().width + first_alien().x
    end
    
    def height
        @aliens.sort_by { |a| a.y }.reverse!
        first_alien().height + first_alien().y
    end
    
    def draw 
        for alien in @aliens
            alien.draw
        end
    end

    def update
        check_remove

        case @moving_direction
        when :right
          if border_right < @window.width - first_alien().width
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

    private

    def create_aliens
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

    def check_remove
        for alien in @aliens
            if alien.remove?
              @aliens.delete(alien)
            end
        end
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