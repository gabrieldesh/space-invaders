class Alien

    attr_reader :x, :y
  
      def initialize
        @image = Gosu::Image.new("assets/alien.png")
        @x = @z = @vel_x = @vel_y = @angle = 0.0
        @score = 0
      end
    
      def warp(x, y)
        @x, @y = x, y
      end

      def width
        @image.width * 3
      end

      def height
        @image.height * 3
      end

      def radius
        20
      end
      
      def update 
      end

      def draw
        @image.draw(@x, @y, @z, scale_x = 3, scale_y = 3)
      end
    end