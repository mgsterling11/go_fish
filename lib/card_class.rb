
#4 cards.each do
#assign symbol 1-4

require 'pry'


class Card
  
  attr_accessor :number, :suit

  @@unplayed_deck = []
  @@played = []

  def self.unplayed_deck
    @@unplayed_deck
  end

  def self.all
    @@all
  end

  def self.played
    @@played
  end

  def initialize(suit, number)
    @number = number
    @suit = suit
  end

  # def self.build_deck
  #   create_cards
  #   populate_numbers
  #   populate_symbols
  #   @@unplayed_deck << self
  #   DECK << self
  # end  
  
  def self.build_deck
    @@all = []
    number_array = ['2','3','4','5','6','7','8','9','10', "Jack", "Queen", "King", "Ace"]
    ["Heart", "Diamond", "Spade", "Club"].each do |suit|
      number_array.each do |number|
        all << Card.new(suit, number)
      end
    end
    unplayed_deck.push(all).flatten!
  end

  self.build_deck  
end






