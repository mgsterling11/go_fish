class CardController

  def self.string_of_cards(array_of_cards)
    array_of_cards.collect do |card|
      "#{card.number} of #{card.suit}s"
    end.join(" - ")
  end

  def self.show_played
    played_cards = PlayedCards.new
    played_cards.render
  end 

end