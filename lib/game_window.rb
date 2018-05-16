require_relative 'cannon'
require_relative 'alien'
require_relative 'shot'

class GameWindow < Gosu::Window
    def initialize
        super 800, 600
        self.caption = "Space Invaders"
    
        @alien = Alien.new
        @player = Cannon.new self
        
        @alien.warp 300, 300
        @elements = [@alien, @player]
        @shots = []
    end
    
    #This method is called once every #update_interval milliseconds while the window is being shown. Your application's main logic should go here.
    def update
      for item in @elements
        item.update
      end

      for shot in @shots
        if shot.remove?
          @shots.delete(shot)
        elsif shot.collide?(@alien)
          @shots.delete(shot)
          @elements.delete(@alien)
        end
        shot.update
      end
    end
  
    #This method is called after every update and whenever the OS wants the window to repaint itself.
    def draw
      for item in @elements
        item.draw 
      end
      for shot in @shots
        shot.draw
      end
    end
  
    #This method is called before #update if a button is pressed while the window has focus.
    def button_down(id)
      if id == Gosu::KB_ESCAPE
        close
      elsif id == Gosu::KB_SPACE
        @shots << Shot.new(self, @player.x + @player.width / 2, @player.y)
      else
        super
      end
    end
  end