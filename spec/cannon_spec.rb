require 'cannon'

describe 'movimentation commands' do

    it 'should move left by 1.5' do
        @cannon = Cannon.new
        @cannon.move_left
        raise unless @cannon.x == -1.5
    end
end
