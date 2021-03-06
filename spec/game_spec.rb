describe Game do

  let (:game) { Game.new }

  context 'Initialization' do

    it 'can be done with the default difficulty level' do
      expect{ game }.not_to raise_error
    end

    it 'can be doen with a very easy pusszle' do
      expect{ Game.new(1) }.not_to raise_error
    end

    it 'can be doen with a very hard pusszle' do
      expect{ Game.new(5) }.not_to raise_error
    end

    it 'can only be done with a single difficulty level' do
      expect{ Game.new(1, 2) }.to raise_error(ArgumentError)
    end

    it 'can only be done with a premitted difficulty level' do
      arg_err_msg = 'Argument must be Fixnum between 1-5'
      invalid_args = [ 0, 6, '1', :a, [1], {'a' => 1} ]
      invalid_args.each do |arg|
        expect{ Game.new(arg) }.to raise_error(ArgumentError, arg_err_msg)
      end
    end

    it 'is done with a new puzzle by default' do
      expect(game.puzzle.class).to eq Puzzle
    end

    it 'is done with a medium level puzzle by defualt' do
      expect(game.puzzle.solved_squares_count).to eq 30
    end
  end

  context 'After Initialization' do

    context 'Puzzle' do 

      context 'Upload' do

        it 'can upload a new puzzle with the default difficulty level' do
          current_puzzle = game.puzzle.current_state
          game.new_puzzle
          expect(game.puzzle.current_state).not_to eq current_puzzle
          expect(game.puzzle.current_state.class).to eq String
          expect(game.puzzle.current_state.chars.count).to eq 81
        end

        it 'can upload a new puzzle with a specificed difficulty level' do
          current_puzzle = game.puzzle.current_state
          game.new_puzzle(1)
          expect(game.puzzle.current_state).not_to eq current_puzzle
          expect(game.puzzle.current_state.class).to eq String
          expect(game.puzzle.current_state.chars.count).to eq 81
        end
      end

      context 'Solution' do

        it "can solve it's current puzzle" do
          expect(game.solve_puzzle).to be true
        end
      end

      context 'Output' do

        it "can be return it's current puzzle as a String" do
          expect(game.current_state.class).to eq String
          expect(game.current_state.chars.count).to eq 81
        end
      end
    end
  end
end
