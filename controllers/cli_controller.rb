class CLIController


  def self.greeting
    puts "Welcome to Go Fish!"
    puts "Let's create some players."
  end

  def self.help_menu
    puts "Here are your options: "
    puts "score - check the score"
    puts "pairs - display all played cards on the table"
    puts "help - display this menu at any time"
    puts "exit - exit the game"
  end 

  def self.current_player_turn
    puts "#{Game.current_game.current_player.name}, it's your turn. Enter a number or face card to ask your opponent for a card."
    puts "Or help to view all options. " 
  end    

  def self.display_score
    puts "#{Game.current_game.current_player.name}, your score is: #{Game.current_game.current_player.score}."
    puts "#{Game.current_game.other_player.name}, your score is: #{Game.current_game.other_player.score}."
  end

  # throws stack level too deep error for exit method, keeping in run.rb for the moment:

  # def self.exit
  #   puts "Thanks for playing! Have a nice day."
  #   exit
  # end
end

