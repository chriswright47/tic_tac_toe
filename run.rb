require_relative "tic_tac_toe.rb"

puts "Hello, world."

puts "What is player one's name?"
print "> "
player_one = gets.chomp
puts "Hello, #{player_one}"

puts "What is player two's name?"
print "> "
player_two = gets.chomp
puts "Hello, #{player_two}"

TicTacToe
  .new(player_one: player_one, player_two: player_two)
  .run
