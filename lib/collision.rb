class Collision

    def initialize params
        @aliens = params[:aliens]
        @cannon = params[:cannon]
        @lives_manager = params[:lives_manager]
        @player_shots = params[:player_shots]
        @alien_shots = params[:alien_shots]
        @game_status = params[:game_status]
    end

    def check
        check_alien_shots
        check_player_shots
    end

    def check_player_shots
        for alien in @aliens
            for shot in @player_shots
                if shot.collide?(alien)
                    @game_status.points += alien.points
                    @aliens.delete(alien)
                    @player_shots.delete(shot)
                end
            end
        end
    end

    def check_alien_shots
        for shot in @alien_shots
            if shot.collide?(@cannon)
                @alien_shots.delete(shot)
                @lives_manager.remove_live
            end
        end
    end
end