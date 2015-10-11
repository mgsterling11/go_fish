class PlayerController

def self.create_users
  puts "Player 1: What is your name?"
  player_1_name = gets.chomp
  puts "What is your age?"
  player_1_age = gets.chomp
  Player.new(player_1_name, player_1_age)

  puts "Player 2: What is your name?"
  player_2_name = gets.chomp
  puts "What is your age?"
  player_2_age = gets.chomp
  Player.new(player_2_name, player_2_age)
end



end
