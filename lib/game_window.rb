require_relative 'cannon'
require_relative 'alien'

class GameWindow < Gosu::Window
    def initialize
        super 800, 600
        self.caption = "Space Invaders"
    
        @alien = Alien.new
        @player = Cannon.new self
        
        @alien.warp 300, 500
        @elements = [@alien, @player]
    end
    
    #This method is called once every #update_interval milliseconds while the window is being shown. Your application's main logic should go here.
    def update
      for item in @elements
        item.update
      end
    end
  
    #This method is called after every update and whenever the OS wants the window to repaint itself.
    def draw
      for item in @elements
        item.draw 
      end
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