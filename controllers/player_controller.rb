class PlayerController

  def self.create_users
    # puts "Player 1: What is your name?"
    # player_1_name = gets.chomp
    # puts "What is your age?"
    # player_1_age = gets.chomp
    # Player.new(player_1_name, player_1_age)

    # puts "Player 2: What is your name?"
    # player_2_name = gets.chomp
    # puts "What is your age?"
    # player_2_age = gets.chomp
    # Player.new(player_2_name, player_2_age)
    2.times {prompt_user}
  end
  
  def self.prompt_user
    puts "Player #{Player.count+1}, please enter your name."
    name = gets.chomp
    puts "Cool! Thanks, #{name}. How old are you?"
    age = gets.chomp.to_i
    Player.new(name, age)
    puts
  end
  
  def self.show_hand(player)
    player_hand = PlayerShowHand.new
    player_hand.render(player)
  end

  # def self.string_of_cards(array_of_cards)
  #   array_of_cards.collect do |card|
  #     "#{card.number} of #{card.suit}s"
  #   end.join(" - ")
  # end

  def self.play_matching(player)
    2.times {player.find_matching}
  end


end
