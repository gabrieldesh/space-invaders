require_relative 'cannon'
require_relative 'alien'
require_relative 'alien_squad'
require_relative 'shot'
require_relative 'collision'
require_relative 'lives_manager'
require_relative 'game_status'

class GameWindow < Gosu::Window
  def initialize
      super 800, 600
      self.caption = "Space Invaders"

      @game_status = GameStatus.new self
      @alien_squad = AlienSquad.new self
      @player = Cannon.new self
      @lives_manager = LivesManager.new self

      @player_shots = Array.new
      @alien_shots = Array.new

      @alien_shot_period = 0

      @collision_manager = Collision.new(
          aliens: @alien_squad.aliens,
          player_shots: @player_shots,
          cannon: @player,
          lives_manager: @lives_manager,
          alien_shots: @alien_shots,
          game_status: @game_status)

      @elements = [@player, @alien_squad, @lives_manager, @game_status]
      @update_list = [@elements, @player_shots, @alien_shots]
  end
    
    #This method is called once every #update_interval milliseconds while the window is being shown. Your application's main logic should go here.
  def update
    @collision_manager.check

    create_alien_shot_if_needed
    
    for item in @update_list
      operate_over_items item, :update
    end
  end

    #This method is called after every update and whenever the OS wants the window to repaint itself.
  def draw
    for item in @update_list
      operate_over_items item, :draw
    end
  end
  
    #This method is called before #update if a button is pressed while the window has focus.
  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    elsif id == Gosu::KB_SPACE
      @player_shots << Shot.new(self, @player, :up)
    else
      super
    end
  end

  private
  def create_alien_shot_if_needed
    @alien_shot_period += 1
    if @alien_shot_period == 20
      @alien_shots << Shot.new(self, @alien_squad.get_random_alien(), :down)
      @alien_shot_period = 0
    end
  end

  def operate_over_items items, operation
    for item in items
      item.send(operation)
    end
  end
end