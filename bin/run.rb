#!usr/bin/env ruby
require_relative '../config/environment.rb'

require 'pry'

# def reload!
#   load 'lib/card_class.rb'
#   load 'lib/player.rb'
#   # load 'lib/computer.rb'
#   load 'lib/game.rb'
#   load 'seed.rb'
# end
  
def greeting
  puts "Welcome to Go Fish!"
end

def help_menu
  puts "Here are your options: "
  puts "score - check the score"
  puts "pairs - display all played cards on the table"
  puts "help - display this menu at any time"
  puts "exit - exit the game"
end 

def user_logic(current_player)
  turn_over = false
  until turn_over
    puts "#{current_player.name}, it's your turn. Enter a number or face card to ask your opponent for a card."
    puts "Or help to view all options. "     
    user_input = get_user_input.chomp.downcase.capitalize.strip
    if user_input == "Score"
      puts "#{current_player.name}, your score is: #{current_player.score}."
      puts "#{Game.current_game.other_player.name}, your score is: #{Game.current_game.other_player.score}."
    elsif user_input == "Pairs"
      puts "The following cards have been played:"
      print PlayerController.string_of_cards(Card.played_sorted)
      print "\n"
    elsif user_input == "Help"
      help_menu
    elsif user_input == "Exit"
      puts "Thanks for playing! Have a nice day."
      exit
    elsif Card.number_array.include?(user_input)
      current_player.ask_and_take(user_input)
      Game.current_game.other_player.check_for_empty
      PlayerController.show_hand(current_player)
      turn_over = true
    else
      puts "Invalid command. Please try again. Type help to view options."
    end
  end
end

def create_game
  Game.new
end

# def show_hand(player)
#   puts "#{player.name}, this is your hand:"
#   print string_of_cards(player.hand)
#   print "\n \n"
# end

# def string_of_cards(array_of_cards)
#   array_of_cards.collect do |card|
#     "#{card.number} of #{card.suit}s"
#   end.join(" - ")
# end

def get_user_input
  user_input = gets.chomp.downcase.strip
end

# system 'clear' << 

def turn(current_player)
  puts "<>< ><> <>< ><>"
  PlayerController.show_hand(current_player)
  user_logic(current_player)
  2.times {current_player.find_matching}
  current_player.check_for_empty
  puts "#{current_player.name}: #{current_player.score}."
  puts "#{Game.current_game.other_player.name}: #{Game.current_game.other_player.score}."
  puts "<>< ><> <>< ><>"
end

greeting
PlayerController.create_users
help_menu
game = create_game

## THIS IS THE MAIN LOOP OF THE GAME!! ##
until game.game_over?
  turn(game.current_player)
  game.switch_player
end


