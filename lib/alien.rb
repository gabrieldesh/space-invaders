require_relative 'image_component'

class Alien < ImageComponent
  
      def initialize (window, x, y)
        super window, x, y, "assets/alien.png"
        @vel_x = @vel_y = @angle = 0.0
        @remove = false
      end

      def radius
        20
      end
      
      def update 
        @x += 1
      end
    end