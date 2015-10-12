class GameWinnerAnnounce

  def render
    puts "WE HAVE A WINNER! GAME OVER."
    puts "#{Game.current_game.winner.name} wins with a score of #{Game.current_game.winner.score}"
  end

end