class PlayerShowHand

  def render(player)
    puts "#{player.name}, this is your hand:"
    print CardController.string_of_cards(player.hand)
    print "\n \n"
  end

end