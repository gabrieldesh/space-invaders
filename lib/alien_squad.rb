require_relative 'alien'

class AlienSquad

    NUMBER_OF_LINES = 5
    NUMBER_OF_COL = 7
    VERTICAL_DISTANCE = 50
    HORIZONTAL_DISTANCE = 40

    def initialize (window)
        @aliens = []
        @x = 0
        @y = 100
        
       for line in 0..NUMBER_OF_LINES
            @linha = []
            for column in 0..NUMBER_OF_COL
                @linha << Alien.new(window,  HORIZONTAL_DISTANCE * column, @y + VERTICAL_DISTANCE * line)
            end 
            @aliens << @linha  
        end
    end

    def width
        @aliens
    end

    def draw 
        for line in @aliens
            for alien in line
                alien.draw
            end
        end
    end

    def update
        for line in @aliens
            for alien in line
                alien.update
            end
        end
    end

    def remove?
    end
end