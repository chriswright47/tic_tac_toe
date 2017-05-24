class TicTacToe
  attr_reader :board, :player_one, :player_two

  def initialize(player_one:, player_two:)
    @player_one = { name: player_one, marker: "🍔" }
    @player_two = { name: player_one, marker: "☃"  }

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
      player_turn(player: player_one)

      print_board

      player_turn(player: player_two)

      print_board
    end
  end

  def player_turn(player:)
    puts "Where would you like to move, #{player[:name]}? You are #{player[:marker]} (choose 1-9):"
    update_board(board_index: STDIN.gets.chomp.to_i - 1, marker: player[:marker])
  end

  def update_board(board_index:, marker:)
    board[board_index / 3][board_index % 3] = marker
  end

  def print_board
    board.each { |row| puts row.join(" | ") }
  end
end
