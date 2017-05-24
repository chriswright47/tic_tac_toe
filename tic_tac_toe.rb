class TicTacToe
  attr_reader :board, :player_one, :player_two

  def initialize(player_one:, player_two:)
    @player_one = player_one
    @player_two = player_two

    @board = [
      %w(- - -),
      %w(- - -),
      %w(- - -),
    ]
  end

  def run
    puts "Starting a new game"
    print_board

    while true do
      puts "Where would you like to move, #{player_one}? You are X (choose 1-9)"
      print "> "
      move_index = gets.chomp.to_i - 1
      board[move_index / 3][move_index % 3] = "X"

      print_board
      puts "Where would you like to move, #{player_two}? You are O (choose 1-9)"
      print "> "
      move_index = gets.chomp.to_i - 1
      board[move_index / 3][move_index % 3] = "O"

      print_board
    end
  end

  def print_board
    board.each { |row| print row.join(" | "); print "\n" }
  end
end
