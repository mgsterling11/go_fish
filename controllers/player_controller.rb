
class PlayerController

  def self.create_users
    2.times {prompt_user}
  end
  
  # view
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

  def ask_for_card(other_player, number)
    PlayerAskView.new.render(other_player, number)
    take_card = other_player.hand.find do |card|
      card.number == number
    end
  end

  def take_card(take_card, current_player, other_player, number)
    if take_card.class == Card
      puts "#{other_player.name}: Yes. (Sigh). Here you go."
      puts
      current_player.hand << other_player.hand.delete(take_card) 
    else
      puts
      puts "#{other_player.name}: Sorry, no #{number}s!" 
      puts "GO FISH!"
      puts
      current_player.draw
    end
  end


  def self.play_matching(player)
    2.times {player.find_matching}
  end


end



  # def self.string_of_cards(array_of_cards)
  #   array_of_cards.collect do |card|
  #     "#{card.number} of #{card.suit}s"
  #   end.join(" - ")
  # end