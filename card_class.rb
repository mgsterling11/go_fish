
#4 cards.each do
#assign symbol 1-4

require 'pry'


class Card
  
  attr_accessor :number, :suit

  @@unplayed_deck = []
  @@played = []
  @cards_array = [] ## HAVING A HARD TIME GETTING THIS TO BE RECOGNIZED 
  DECK = [] 

  def initialize
    @number = number
    @suit = suit
  end

  def build_deck
    create_cards
    populate_numbers
    populate_symbols
    @@unplayed_deck << self
    DECK << self
  end  
  
  def create_cards 
    @cards_array = []
    52.times do (cards_array.push(Card.new))
    end
  end
  
  def populate_numbers 
    @cards_array = []
    number_array = [2,3,4,5,6,7,8,9,10, "Jack", "Queen", "King", "Ace"]
    x = 0

    while x <= 52 
      cards_array.each do |card|
        card.number = number_array.first  
        number_array = number_array.rotate 
        x+=1
      end
    end
  end

  def populate_symbols
    @cards_array = []
    suit_array = ["Heart", "Diamond", "Spade", "Club"]
    x = 0

    while x <= 52
      cards_array.each do |card|
        card.suit = suit_array.first
        suit_array = suit_array.rotate 
        x+=1
      end
    end  
  end
binding.pry

end





