class PlayedCards

  def render
    puts "\nThe following cards have already been played:"
    print CardController.string_of_cards(Card.played)
    puts "\n"
  end

end