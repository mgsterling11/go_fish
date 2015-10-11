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

def self.show_hand(player)
  puts "#{player.name}, this is your hand:"
  print self.string_of_cards(player.hand)
  print "\n \n"
end

def self.string_of_cards(array_of_cards)
  array_of_cards.collect do |card|
    "#{card.number} of #{card.suit}s"
  end.join(" - ")
end

def self.play_pairs
  puts "The following cards have been played:"
  print string_of_cards(Card.played_sorted)
  print "\n"
end
end
