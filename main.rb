require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480
    
    self.caption = "Hello, world!"
  end
  
  def update
  end
  
  def draw
  end
end

GameWindow.new.show