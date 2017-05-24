require_relative "tic_tac_toe.rb"

TicTacToe.new

puts "Hello, world."


puts "What is player one's name?"
print "> "
player_one = gets.chomp
puts "Hello, #{player_one}"

puts "What is player two's name?"
print "> "
player_two = gets.chomp
puts "Hello, #{player_two}"


puts "Starting a new game"
board = [
  %w(- - -),
  %w(- - -),
  %w(- - -),
]
board.each { |row| print row.join(" | "); print "\n" }

while true do
  puts "Where would you like to move, #{player_one}? You are X (choose 1-9)"
  print "> "
  move_index = gets.chomp.to_i - 1
  board[move_index / 3][move_index % 3] = "X"

  board.each { |row| print row.join(" | "); print "\n" }


  puts "Where would you like to move, #{player_two}? You are O (choose 1-9)"
  print "> "
  move_index = gets.chomp.to_i - 1
  board[move_index / 3][move_index % 3] = "O"

  board.each { |row| print row.join(" | "); print "\n" }

end
