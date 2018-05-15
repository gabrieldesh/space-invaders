require 'cannon'
describe 'cannon' do
    subject { Cannon.new }

    describe 'given initialization' do

        it 'when initialize then the position should be x=0 and y=0' do
            expect(subject.x).to be == 0.0
            expect(subject.y).to be == 0.0
        end
    end

    describe 'given movimentation commands' do
        it 'when the button_down is KB_LEFT then x should decrement 1.5' do
            allow(Gosu).to receive(:button_down?).and_return(false)
            allow(Gosu).to receive(:button_down?).with(Gosu::KB_LEFT).and_return(true)
            old_x_position = subject.x
            
            subject.move
            expect(subject.x).to be == old_x_position - 1.5
        end

        it 'when the button_down is KB_RIGHT then x should increment 1.5' do
            allow(Gosu).to receive(:button_down?).and_return(false)
            allow(Gosu).to receive(:button_down?).with(Gosu::KB_RIGHT).and_return(true)
            old_x_position = subject.x
            
            subject.move
            expect(subject.x).to be == old_x_position + 1.5
        end
    end
end
