require_relative 'alien'

class AlienSquad

    NUMBER_OF_LINES = 5
    NUMBER_OF_COL = 7
    VERTICAL_DISTANCE = 50
    HORIZONTAL_DISTANCE = 40

    def initialize (window)
        @window = window
        @aliens = []
        @x = 0
        @y = 100
        @moving_direction = :right
        
       for line in 0..NUMBER_OF_LINES
            @linha = []
            for column in 0..NUMBER_OF_COL
                @linha << Alien.new(window, @x + HORIZONTAL_DISTANCE * column, @y + VERTICAL_DISTANCE * line)
            end 
            @aliens << @linha  
        end
        @alien_width  = @aliens[0][0].width
        @alien_height = @aliens[0][0].height
    end

    def width
        HORIZONTAL_DISTANCE * NUMBER_OF_COL + @alien_width
    end
    
    def height
        VERTICAL_DISTANCE * NUMBER_OF_LINES + @alien_height
    end
    
    def move_left
      for line in @aliens
          for alien in line
              alien.move_left 1
          end
      end
      @x -= 1
    end
    
    def move_right
      for line in @aliens
          for alien in line
              alien.move_right 1
          end
      end
      @x += 1
    end
    
    def move_down
      for line in @aliens
          for alien in line
              alien.move_down 10
          end
      end
    end

    def draw 
        for line in @aliens
            for alien in line
                alien.draw
            end
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

    def remove?
    end
end