require_relative 'font_component' 

class GameStatus 

    attr_accessor :points, :level, :state

    def initialize window
        @points = 0
        @level = 1
        @x = 5
        @y = 5
        @points_component = FontComponent.new window, @x, @y
        @level_component = FontComponent.new window, window.width / 2, @y
    end

    def update
    end

    def draw
        @points_component.draw('Points: ' + @points.to_s)
        @level_component.draw('Level: ' + @level.to_s)
    end
end