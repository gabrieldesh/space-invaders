require_relative 'font_component' 

class GameStatus 

    attr_accessor :points, :level, :state

    def initialize window, lives_manager, aliens_squad
        @window = window
        @state = :introduction
        @lives_manager = lives_manager
        @aliens_squad = aliens_squad
        @points = 0
        @level = 1
        @x = 5
        @y = 5
        @points_component = FontComponent.new window, @x, @y
        @level_component = FontComponent.new window, window.width / 2, @y
    end

    def update
        if @aliens_squad.number_of_aliens == 0
            @aliens_squad.new_level
            @level += 1
        elsif @lives_manager.number_of_lives == 0 || @aliens_squad.border_down >= @window.height - 100 
            @state = :end
        end
    end

    def draw
        @points_component.draw('Score: ' + @points.to_s)
        @level_component.draw('Level: ' + @level.to_s)
    end
end