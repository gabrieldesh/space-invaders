require 'values'

module State
    State = Value.new(:aliens_squad,
                      :cannon,
                      :lifes_manager,
                      :player_shots,
                      :alien_shots,
                      :game_status
    ) do
        def increment_points(points)
            with(game_status: game_status.increment_points(points))
        end
    
        def delete_alien(alien)
            with(aliens_squad: aliens_squad.delete_alien(alien))
        end
    
        def delete_player_shot(shot)
            with(player_shots: player_shots - [shot])
        end
    
        def delete_alien_shot(shot)
            with(alien_shots: state.alien_shots - [shot])
        end
    
        def remove_life
            with(lifes_manager: lifes_manager.remove_life)
        end
    end

    def new(params)
        State.with(params)
    end
    module_function :new
end