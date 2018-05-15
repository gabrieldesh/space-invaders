require_relative 'cannon'
require_relative 'alien'

class GameWindow < Gosu::Window
    def initialize
        super 800, 600
        self.caption = "Tutorial Game"
    
        # @background_image = Gosu::Image.new("media/space.png", :tileable => true)
    
        @alien = Alien.new
        @player = Cannon.new
        
        @player.warp 400, 550
        @alien.warp 300, 500
      end
    
      #This method is called once every #update_interval milliseconds while the window is being shown. Your application's main logic should go here.
      def update
        @player.move
      end
    
      #This method is called after every update and whenever the OS wants the window to repaint itself.
      def draw
        @player.draw
        @alien.draw
        # @background_image.draw(0, 0, 0)
      end
    
      #This method is called before #update if a button is pressed while the window has focus.
      def button_down(id)
        if id == Gosu::KB_ESCAPE
          close
        else
          super
        end
      end
    end