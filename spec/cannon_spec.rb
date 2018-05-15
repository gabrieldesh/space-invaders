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
        before {allow(Gosu).to receive(:button_down?).and_return(false)}
        before {@old_x_position = subject.x}

        describe 'when the button_down' do
            describe 'is KB_LEFT 'do
                before {allow(Gosu).to receive(:button_down?).with(Gosu::KB_LEFT).and_return(true)}

                it 'then x should decrement 1.5' do
                    subject.warp 10, 0
                    @old_x_position = subject.x

                    subject.move
                    
                    expect(subject.x).to be == @old_x_position - 1.5
                end

                describe 'and the image reach left border' do
                    it 'then shouldn\'t  decrement' do                        
                        subject.move

                        expect(subject.x).to be == @old_x_position
                    end
                end
            end
            
            describe 'is KB_RIGHT' do 
                before {allow(Gosu).to receive(:button_down?).with(Gosu::KB_RIGHT).and_return(true)}

                it 'then x should increment 1.5' do    
                    subject.move
                    expect(subject.x).to be == @old_x_position + 1.5
                end
            
                describe 'and the image reach right border' do
                    it 'then shouldn\'t  increment' do
                        subject.warp  800 - subject.width , 0
                        @old_x_position = subject.x

                        subject.move
                        expect(subject.x).to be == @old_x_position
                    end
                end
            end

        end
    end
end
