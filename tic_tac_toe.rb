require_relative "board.rb"

class TicTacToe
  attr_reader :board, :player_one, :player_two

  def initialize(player_one:, player_two:)
    @player_one = Player.new(name: player_one, marker: "🍔")
    @player_two = Player.new(name: player_two, marker: "☃")

    @board      = Board.new
  end

  def run
    puts "Starting a new game"
    puts board

    @winner = play_game

    end_game
  end

  def play_game
    9.times do |i|
      puts @board

      player = i.even? ? player_one : player_two

      update_board(board_index: player.get_move(possible_moves: board.empty_square_indexes), marker: player.marker)

      return player if board.player_has_won?
    end
    :catz_game
  end

  def update_board(board_index:, marker:)
    board.mark_square(board_index: board_index, marker: marker)
  end

  def end_game
    puts "------------------------------"

    if @winner == :catz_game
      puts "Catz Game. No one wins. Thanks for Playing!"
    else
      puts "#{@winner.name} wins! Thanks for Playing!"
    end

    puts "------------------------------"
    puts board
  end
end

class Player
  attr_reader :name, :marker

  def initialize(name:, marker:, artificial: false)
    @name   = name
    @marker = marker
    @artificial = artificial
  end

  def to_s
    name
  end

  def artificial?
    name == "foo"
  end

  def get_move(possible_moves:)
    if artificial?
      possible_moves.sample - 1
    else
      puts "Where would you like to move, #{name}? You are #{marker} (choose board space 1-9):"

      STDIN.gets.chomp.to_i - 1
    end
  end
end
