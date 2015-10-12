class ViewScore  
  def render
    puts "#{Game.current_game.current_player.name}, your score is: #{Game.current_game.current_player.score}."
    puts "#{Game.current_game.other_player.name}, your score is: #{Game.current_game.other_player.score}."
  end
end