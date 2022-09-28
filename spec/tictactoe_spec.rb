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
        invalid_move = 'a'
        valid_move = '1'
        allow(move).to receive(:gets).and_return(invalid_move, valid_move)
      end

      it 'puts invalid move once, then returns move' do
        expect(move).to receive(:puts).with('Invalid move').once
        move.get_move
      end
    end

    context 'when invalid move is entered multiple times' do
      before do
        valid_move = '1'
        invalid_one = 'a'
        invalid_two = 'hello'
        invalid_three = '10'
        invalid_four = '!'
        invalid_five = 'b'
        allow(move).to receive(:gets).and_return(invalid_one, invalid_two, invalid_three,
                                                 invalid_four, invalid_five, valid_move)
      end

      it 'puts invalid move 5 times, then returns move' do
        expect(move).to receive(:puts).with('Invalid move').exactly(5).times
        move.get_move
      end
    end

    context 'when a move is entered that has already been selected' do
      before do
        new_board = "*-----------*\n" +
                    "| 1 | 2 | 3 |\n" +
                    "|---+---+---|\n" +
                    "| 4 | 5 | 6 |\n" +
                    "|---+---+---|\n" +
                    "| 7 | 8 | X |\n" +
                    "*-----------*\n"
        move.instance_variable_set(:@board, new_board)
        already_chosen_move = '9'
        valid_move = '8'
        allow(move).to receive(:gets).and_return(already_chosen_move, valid_move)
      end

      it 'puts invalid move, then returns move' do
        expect(move).to receive(:puts).with('Invalid move').once
        move.get_move
      end
    end
  end

  describe 'switch_player' do
    subject(:switch_test) { described_class.new }

    context 'when turn is even' do
      before do
        switch_test.instance_variable_set(:@turn, 2)
        allow(switch_test).to receive(:puts)
      end

      it 'sets @player to O' do
        expect { switch_test.switch_player }
          .to change { switch_test.instance_variable_get(:@player) }.to('O')
      end
    end

    context 'when turn is odd' do
      before do
        switch_test.instance_variable_set(:@turn, 3)
        allow(switch_test).to receive(:puts)
      end

      it 'sets @player to X' do
        expect { switch_test.switch_player }
          .to change { switch_test.instance_variable_get(:@player) }.to('X')
      end
    end
  end

  describe '#game_round' do
    # Only contains other methods. Test those methods individually
  end

  describe '#game_over?' do
    subject(:win_test) { described_class.new }

    context 'when X has three in a row horizontally' do
      before do
        win_test.instance_variable_set(:@board, 'XXX456789')
      end

      it 'declares X winner' do
        expect(win_test).to receive(:puts).with("\nX wins!")
        expect(win_test.game_over?).to eq(true)
      end
    end

    context 'when X has three in a row vertically' do
      before do
        win_test.instance_variable_set(:@board, 'X23X56X89')
      end

      it 'declares X winner' do
        expect(win_test).to receive(:puts).with("\nX wins!")
        expect(win_test.game_over?).to eq(true)
      end
    end

    context 'when X has three in a row diagonally' do
      before do
        win_test.instance_variable_set(:@board, 'X234X678X')
      end

      it 'declares X winner' do
        expect(win_test).to receive(:puts).with("\nX wins!")
        expect(win_test.game_over?).to eq(true)
      end
    end

    context 'when O has three in a row horizontally' do
      before do
        win_test.instance_variable_set(:@board, '123OOO789')
      end

      it 'declares O winner' do
        expect(win_test).to receive(:puts).with("\nO wins!")
        expect(win_test.game_over?).to eq(true)
      end
    end

    context 'when O has three in a row verically' do
      before do
        win_test.instance_variable_set(:@board, '1O34O67O9')
      end

      it 'declares O winner' do
        expect(win_test).to receive(:puts).with("\nO wins!")
        expect(win_test.game_over?).to eq(true)
      end
    end

    context 'when O has three in a row diagonally' do
      before do
        win_test.instance_variable_set(:@board, '12O4O6O89')
      end

      it 'declares O winner' do
        expect(win_test).to receive(:puts).with("\nO wins!")
        expect(win_test.game_over?).to eq(true)
      end
    end

    context 'when the board is filled without a winner' do
      before do
        win_test.instance_variable_set(:@board, 'XOXXOOOXX')
        win_test.instance_variable_set(:@turn, 10)
      end

      it 'declares a tie' do
        expect(win_test).to receive(:puts).with("\nIt's a tie!")
        expect(win_test.game_over?).to eq(true)
      end
    end
  end

  describe '#play_game' do
    # Test methods inside individually
  end

  describe '#play_again?' do
    # Test coverage found elsewhere. No tests needed.
  end

  describe '#clear' do
    # Contains a single put statement. No testing needed.
  end
end
