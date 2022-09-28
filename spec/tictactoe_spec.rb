<<-HEREDOC
Write tests for your Tic Tac Toe project.
In this situation, it’s not quite as simple as just coming up with inputs
and making sure the method returns the correct thing. You’ll need to make
sure the tests that determine victory or loss conditions are correctly assessed.

Start by writing tests to make sure players win when they should,
e.g. when the board reads X X X across the top row,
your #game_over method (or its equivalent) should trigger.

Test each of your critical methods to make sure they function properly and
handle edge cases.

Use mocks/doubles to isolate methods to make sure that they’re sending back the
right outputs.
HEREDOC

require_relative '../lib/tictactoe.rb'

describe GameBoard do
  describe '#initialize' do
    # No tests needed; only variable assignments & puts
  end

  describe '#update_display' do
    # No tests needed; only puts methods
  end

  describe 'get_move' do
    subject(:move) { described_class.new }

    context 'when move entered is valid' do
      before do
        valid_move = '1'
        allow(move).to receive(:gets).and_return(valid_move)
      end

      it 'returns move' do
        expect(move.get_move).to eq('1')
      end
    end

    context 'when an invalid move is entered' do
      before do
        valid_move = '1'
        invalid_move = 'a'
        allow(move).to receive(:gets).and_return(invalid_move, valid_move)
      end

      it 'puts invalid move once, then returns move' do
        expect(move).to receive(:puts).with('Invalid input').once
        expect(move).to eq('1')
        move.get_move
      end
    end

    context 'when invalid move is entered 5 times' do
      before do
        valid_move = '1'
        invalid_1 = 'a'
        invalid_2 = 1
        invalid_3 = '10'
        invalid_4 = '!'
        invalid_5 = '2'
        allow(move).to receive(:gets).and_return(valid_move, valid_move)
        allow(move).to receive(:gets).and_return()
      end

      xit 'puts invalid move 5 times, then returns move' do
      end
    end
  end

  describe 'switch_player' do
    context 'when turn is even' do
      xit 'sets @player to O' do
      end
    end

    context 'when turn is odd' do
      xit 'sets @player to X' do
      end
    end
  end

  describe '#game_round' do
    # Only contains other methods. Test those methods individually
  end

  describe '#game_over?' do
    context 'when X has three in a row' do
      xit 'declares X winner' do
      end
    end

    context 'when O has three in a row' do
      xit 'declares O winner' do
      end
    end

    context 'when the board is filled without a winner' do
      xit 'declares a tie' do
      end
    end
  end

  describe '#play_game' do
    # Test methods inside individually
  end

  describe '#play_again?' do
    context 'when the player enters "y"' do
      xit 'starts a new game' do
      end
    end

    context 'when the player enters anything else' do
      xit 'puts thank you and exits the program' do
      end
    end
  end

  describe '#clear' do
    # Contains a single put statement. No testing needed.
  end
end
