require_relative 'cannon'
require_relative 'alien'
require_relative 'alien_squad'
require_relative 'shot'
require_relative 'collision'

class GameWindow < Gosu::Window
    def initialize
        super 800, 600
        self.caption = "Space Invaders"
    
        @alien_squad = AlienSquad.new self
        @player = Cannon.new self
        @shots = Array.new
        @collision_manager = Collision.new @alien_squad.aliens, @shots
        
        @elements = [@player, @alien_squad]
    end
    
    #This method is called once every #update_interval milliseconds while the window is being shown. Your application's main logic should go here.
    def update
      @collision_manager.check

      delete_if_needed @shots

      for item in @elements
        item.update
      end
      for shot in @shots
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

    private
    def delete_if_needed items
      for item in items
        if item.remove?
          items.delete(item)
        end
      end
    end
  end