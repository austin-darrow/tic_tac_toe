class GameBoard
  def initialize
    @banner = "=============\n=Tic-Tac-Toe=\n=============\n"
    puts self.get_board
  end

  def setup_board
    @turn = 1
    @board = "*-----------*\n" +
             "| 1 | 2 | 3 |\n" +
             "|---+---+---|\n" +
             "| 4 | 5 | 6 |\n" +
             "|---+---+---|\n" +
             "| 7 | 8 | 9 |\n" +
             "*-----------*\n"
    @potential_wins = []
  end

  def get_board
    puts @banner
    @board
  end

  def get_move
    @move = gets.chomp
    options = @board.split('').grep(/[\d]/).join
    until options.include?(@move)
      puts "Invalid move"
      @move = gets.chomp
    end
    @move
  end

  def get_player
    @player = @turn.even? ? 'O' : 'X'
    puts "\nIt is #{@player}'s turn.\nChoose an open position."
  end

  def game_round
    get_player
    get_move
    @turn += 1
    @board = @board.gsub(@move, @player)
    compile_win_state
    game_over?
    clear
    get_board
  end

  def compile_win_state
    b = @board.split('').grep(/[XO\d]/)
    @potential_wins = [b.slice(0..2), b.slice(3..5), b.slice(6..8)]
    @potential_wins += @potential_wins.transpose
    @potential_wins.push([b[0], b[4], b[8]])
    @potential_wins.push([b[2], b[4], b[6]])
  end

  def game_over?
    if @potential_wins.any? { |win| win.all? { |pos| pos == 'X' } }
      puts "\nX wins!"
      return true
    elsif @potential_wins.any? { |win| win.all? { |pos| pos == 'O' } }
      puts "\nO wins!"
      return true
    elsif @turn > 9
      puts "\nIt's a tie!"
      return true
    end
    return false
  end

  def play_game
    clear
    setup_board
    puts get_board
    while game_over? == false
      puts game_round
    end
    play_again?
  end

  def play_again?
    puts "Enter 'y' to play again."
    response = gets.chomp.downcase
    if response == 'y'
      setup_board
      self.play_game
    else
      puts "Thanks for playing!"
    end
  end

  def clear
    puts %x(/usr/bin/clear)
  end
end

test = GameBoard.new
test.play_game
