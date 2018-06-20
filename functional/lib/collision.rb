require_relative 'state'

module Collision

    def check state
        newState = check_alien_shots state
        return check_player_shots newState
    end

    def check_player_shots state
        aliens = state.aliens_squad.aliens
        shots  = state.player_shots

        aliens.inject(state) { |state, alien|
            shots.inject(state) { |state, shot|
                if shot.collide?(alien)
                    state.increment_points(alien.points)
                         .delete_alien(alien)
                         .delete_player_shot(shot)
                else
                    state
                end
            }
        }
    end

    def check_alien_shots state
        state.alien_shots.inject(state) { |state, shot|
            if shot.collide?(state.cannon)
                state.delete_alien_shot(shot)
                     .remove_life
            else
                state
            end
        }
    end
end