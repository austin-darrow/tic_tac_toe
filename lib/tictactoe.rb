class GameBoard
  def initialize
    @board = "*-----------*\n" +
             "| 1 | 2 | 3 |\n" +
             "|---+---+---|\n" +
             "| 4 | 5 | 6 |\n" +
             "|---+---+---|\n" +
             "| 7 | 8 | 9 |\n" +
             "*-----------*\n"
    @turn = 1
  end

  def update_display
    clear
    puts "=============\n" +
         "=Tic-Tac-Toe=\n" +
         "=============\n"
    puts @board
  end

  def get_move
    loop do
      move = gets.chomp
      return move if @board.split('').grep(/[\d]/).include?(move)

      puts 'Invalid move'
    end
  end

  def switch_player
    @player = @turn.even? ? 'O' : 'X'
    puts "\nIt is #{@player}'s turn.\nChoose an open position."
  end

  def game_round
    switch_player
    @turn += 1
    move = get_move
    @board.gsub!(move, @player)
  end

  def game_over?
    b = @board.split('').grep(/[XO\d]/)
    wins = [b.slice(0..2), b.slice(3..5), b.slice(6..8)]
    wins += wins.transpose
                .push([b[0], b[4], b[8]], [b[2], b[4], b[6]])

    if wins.any? { |win| win.all? { |pos| pos == 'X' } }
      puts "\nX wins!"
      true
    elsif wins.any? { |win| win.all? { |pos| pos == 'O' } }
      puts "\nO wins!"
      true
    elsif @turn > 9
      puts "\nIt's a tie!"
      true
    end
  end

  def play_game
  until game_over?
    update_display
    game_round
  end
  play_again?
  end

  def play_again?
    puts "Enter 'y' to play again."
    response = gets.chomp.downcase
    if response == 'y'
      GameBoard.new.play_game
    else
      puts 'Thanks for playing!'
    end
  end

  def clear
    puts %x(/usr/bin/clear)
  end
end

# GameBoard.new.play_game
