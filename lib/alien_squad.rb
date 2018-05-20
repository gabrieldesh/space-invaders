require_relative 'alien'
require_relative 'base_component'

class AlienSquad < BaseComponent

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
        if @aliens.length > 0
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
    end

    def get_random_alien
        @aliens[rand(@aliens.length).to_i]
    end

    def border_down
        @aliens.max_by { |a| a.y }.y
    end

    private

    def create_aliens
        @aliens = []
        
        NUMBER_OF_COL.times { |column| @aliens << Alien.new(@window, @x + 20 + HORIZONTAL_DISTANCE * column, @y + VERTICAL_DISTANCE + 30, 30, "assets/alien2.png") }
        NUMBER_OF_COL.times { |column| @aliens << Alien.new(@window, @x + HORIZONTAL_DISTANCE * column, @y + VERTICAL_DISTANCE * 2, 20, "assets/alien3.png") }
        NUMBER_OF_COL.times { |column| @aliens << Alien.new(@window, @x + HORIZONTAL_DISTANCE * column, @y + VERTICAL_DISTANCE * 3, 20, "assets/alien3.png") }
        NUMBER_OF_COL.times { |column| @aliens << Alien.new(@window, @x + HORIZONTAL_DISTANCE * column, @y + VERTICAL_DISTANCE * 4, 10, "assets/alien.png") }
        NUMBER_OF_COL.times { |column| @aliens << Alien.new(@window, @x + HORIZONTAL_DISTANCE * column, @y + VERTICAL_DISTANCE * 5, 10, "assets/alien.png") }
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