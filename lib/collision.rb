class Collision

    def initialize aliens, shots
        @aliens = aliens
        @shots = shots
    end

    def check
        for alien in @aliens
            for shot in @shots
                if shot.collide?(alien)
                    shot.remove = true
                    alien.remove = true
                end
            end
        end
    end
end