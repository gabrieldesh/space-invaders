require 'cannon'
describe 'cannon' do
    let(:window) { Gosu::Window.new 800, 600 }
    subject { Cannon.new window }


    describe 'given initialization' do

        it 'then the position should be x=0 and y=0' do
            expect(subject.x).to be == window.width / 2 - subject.width / 2
            expect(subject.y).to be == window.height - 50
        end
    end

    describe 'given movimentation commands' do
        before {allow(Gosu).to receive(:button_down?).and_return(false)}
        before {@old_x_position = subject.x}

        describe 'when the button_down' do
            describe 'is KB_LEFT 'do
                before {allow(Gosu).to receive(:button_down?).with(Gosu::KB_LEFT).and_return(true)}

                it 'then x should decrement 1.5' do
                    
                    @old_x_position = subject.x

                    subject.move
                    
                    expect(subject.x).to be == @old_x_position - 5
                end

                describe 'and the image reach left border' do
                    it 'then shouldn\'t  decrement' do                        
                        subject.x = 0
                        @old_x_position = subject.x

                        subject.move

                        expect(subject.x).to be == @old_x_position
                    end
                end
            end
            
            describe 'is KB_RIGHT' do 
                before {allow(Gosu).to receive(:button_down?).with(Gosu::KB_RIGHT).and_return(true)}

                it 'then x should increment 1.5' do    
                    subject.move
                    expect(subject.x).to be == @old_x_position + 5
                end
            
                describe 'and the image reach right border' do
                    it 'then shouldn\'t  increment' do
                        subject.x = window.width - subject.width
                        @old_x_position = subject.x

                        subject.move
                        
                        expect(subject.x).to be == @old_x_position
                    end
                end
            end

        end
    end
end
