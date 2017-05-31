class Board
  attr_reader :empty_marker, :squares

  def initialize(empty_marker: "-")
    @empty_marker = empty_marker
    @squares      = Array.new(3) { Array.new(3) { empty_marker } }
    # [
    #   ["-","-","-"],
    #   ["-","-","-"],
    #   ["-","-","-"]
    # ]
  end

  def to_s
    squares.each { |row| puts row.join(" | ") }
  end

  def mark_square(board_index:, marker:)
    squares[board_index / 3][board_index % 3] = marker
  end

  def game_over?
    player_has_won? || no_empty_spaces?
  end

  def game_result
    return :catz_game if no_empty_spaces?
    # returns a marker if a player has won
  end

  def player_has_won?
    three_in_a_row? ||
      three_in_a_column? ||
      three_in_a_diagonal?
  end

  def three_in_a_row?
    squares.any? { |row| tic_tac_toe?(squares: row) }
  end

  def three_in_a_column?
    squares.transpose.any? { |column| tic_tac_toe?(squares: column) }
  end

  def three_in_a_diagonal?
    [
      [squares[0][0], squares[1][1], squares[2][2]],
      [squares[0][2], squares[1][1], squares[2][0]]
    ].any? {|diagonal| tic_tac_toe?(squares: diagonal) }
  end

  def tic_tac_toe?(squares:)
    squares.none? { |square| square == empty_marker } && # No empty spaces AND
        squares.uniq.length == 1 # only one type of marker
  end

  def no_empty_spaces?
    !squares.flatten.any? { |square| square == empty_marker }
  end
end
