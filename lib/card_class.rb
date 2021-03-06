class Card
  
  attr_accessor :number, :suit

  @@unplayed_deck = []
  @@played = []
  @@suit_array = ["Heart", "Diamond", "Spade", "Club"]
  @@number_array = ['2','3','4','5','6','7','8','9','10', "Jack", "Queen", "King", "Ace"]

  def initialize(suit, number)
    @number = number
    @suit = suit
  end
  
  def self.number_array
    @@number_array
  end

  def self.unplayed_deck
    @@unplayed_deck
  end

  def self.all
    @@all
  end

  def self.played
    @@played
  end

  def self.played_sorted
    @@played.sort_by do |card|
      @@number_array.index(card.number)
    end
    # Returns played cards sorted by number array
  end
  
  def self.build_deck
    @@all = []
    # number_array = ['2','3','4','5','6','7','8','9','10', "Jack", "Queen", "King", "Ace"]
    @@suit_array.each do |suit|
      @@number_array.each do |number|
        all << Card.new(suit, number)
      end
    end
    unplayed_deck.push(all).flatten!
  end

  self.build_deck  
end






