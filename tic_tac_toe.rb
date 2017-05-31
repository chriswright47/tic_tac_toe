require_relative "board.rb"

class TicTacToe
  attr_reader :board, :player_one, :player_two

  def initialize(player_one:, player_two:)
    @player_one = { name: player_one, marker: "🍔" }
    @player_two = { name: player_two, marker: "☃"  }

    @board = Board.new
  end

  def run
    puts "Starting a new game"
    puts board

    # until board.game_over? do
    #   # switch back and forth between player one and two

    # end

    while true do
      player_turn(player: player_one)
      break if board.game_over?
      puts board

      player_turn(player: player_two)
      break if board.game_over?
      puts board
    end

    puts "------------------------------"
    if board.game_result == :catz_game
      puts "Catz Game. No one wins. Thanks for Playing!"
    else
      puts "Game Over: Thanks for Playing!"
    end
    puts "------------------------------"
    puts board
  end

  def player_turn(player:)
    puts "Where would you like to move, #{player[:name]}? You are #{player[:marker]} (choose 1-9):"
    update_board(board_index: STDIN.gets.chomp.to_i - 1, marker: player[:marker])
  end

  def update_board(board_index:, marker:)
    board.mark_square(board_index: board_index, marker: marker)
  end
end
