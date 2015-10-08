class Person
  attr_accessor :hand, :score
  attr_reader :name, :age

  @@players = []

  def self.players
    @@players
  end

  def initialize(name, age)
    @hand=[]
    @name = name
    @age = age
    @score = 0
    @@players << self
  end

  # Removes a card from the deck and adds it to hand
  def draw
    rand_card = Card.unplayed_deck.length
    @hand << Card.unplayed_deck.delete_at(rand_car)
  end

  def ask_and_take(number, player)
    take_card=nil
    take_card = player.hand.find do |card|
      card.number == number
    end
    if take_card.class = Card
      hand << player.hand.delete(take_card) 
    else
      "Go fish"
    end
  end

  # Outputs an array of all the numbes in your hand. 
  def numbers_in_hand
    hand.collect {|card| card.number}
  end

  # Outputs a number on matching card
  def find_matching
    numbers_array = numbers_in_hand
    match_num = 0
    match_num = numbers_array.find do |card|
      hand.count(card.number) > 1
    end
    play_pairs(match_num) unless match_num == 0
  end

  # Takes first two cards with matching numbers, removes
  # them from hand, and adds them to Card.played
  def play_pairs(match_num)
    2.times do
      card = hand.find {|card| card.number == match_num}
      Card.played << hand.delete(card)
    end
    score += 1
  end

  def check_for_empty
    5.times {draw} if hand.empty?
  end

  # ACCESS NEEDED
  # attr_accessor :Card.unplayed_deck, :Card.unplayed
  # 

end