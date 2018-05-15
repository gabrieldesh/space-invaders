require_relative 'cannon'

class GameWindow < Gosu::Window
    def initialize
        super 800, 600
        self.caption = "Tutorial Game"
    
        # @background_image = Gosu::Image.new("media/space.png", :tileable => true)
    
        @player = Cannon.new
        @player.warp(400, 550)
      end
    
      def update
        if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
          @player.move_left
        end
        if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
          @player.move_right
        end
        if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_0
          @player.accelerate
        end
        # @player.move
      end
    
      def draw
        @player.draw
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