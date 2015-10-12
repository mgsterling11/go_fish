class CurrentPlayerMessage
  
  def render
    puts "#{Game.current_game.current_player.name}, it's your turn. Enter a number or face card to ask your opponent for a card."
    puts "Or help to view all options. " 
  end    

end
