
class Player
  attr_accessor :hand, :score
  attr_reader :name, :age

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, age)
    @hand=[]
    @name = name
    @age = age
    @score = 0
    @@all << self
  end

  # Removes a card from the deck and adds it to hand

  def ask_and_take(number, player = Game.current_game.other_player)
    take_card=nil
    puts "Hey, #{player.name}, do you have any #{number}s?"
    take_card = player.hand.find do |card|
      card.number == number
    end
    if take_card.class == Card
      puts "#{player.name}: Yes. (Sigh). Here you go."
      hand << player.hand.delete(take_card) 
    else
      puts "#{player.name}: Sorry, no #{number}s!" 
      puts "GO FISH!"
      draw
    end
  end

  # Outputs an array of all the numbes in your hand. 
  def numbers_in_hand
    hand.collect {|card| card.number}
  end

  # Outputs a number on matching card
  def find_matching
    numbers_array = numbers_in_hand
    match_num = numbers_array.find do |card|
      numbers_array.count(card) > 1
    end
    play_pairs(match_num) if match_num
  end

  # Takes first two cards with matching numbers, removes
  # them from hand, and adds them to Card.played
  def play_pairs(match_num)
    2.times do
      card = hand.find {|card| card.number == match_num}
      Card.played << hand.delete(card) if card
    end
    @score += 1
  end

  def draw
    rand_card = Card.unplayed_deck.length
    @hand << Card.unplayed_deck.delete_at(rand(rand_card))
  end

  def check_for_empty
    5.times {draw} if hand.empty?
  end

end