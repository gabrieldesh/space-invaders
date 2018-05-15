require_relative 'cannon'
require_relative 'alien'

class GameWindow < Gosu::Window
    def initialize
        super 800, 600
        self.caption = "Tutorial Game"
    
        # @background_image = Gosu::Image.new("media/space.png", :tileable => true)
    
        @alien = Alien.new
        @player = Cannon.new
        @player.warp(400, 550)
        @alien.warp 300, 500
      end
    
      def update
        if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
          @player.move_left
        end
        if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
          @player.move_right
        end
      end
    
      def draw
        @player.draw
        @alien.draw
        # @background_image.draw(0, 0, 0)
      end
    
      def button_down(id)
        if id == Gosu::KB_ESCAPE
          close
        else
          super
        end
      end
    end