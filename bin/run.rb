#!usr/bin/env ruby
require_relative '../config/environment.rb'

require 'pry'


def user_logic(current_player)
  turn_over = false
  until turn_over
    CLIController.current_player_turn
      
    user_input = get_user_input

    if user_input == "Score"
      CLIController.display_score
    elsif user_input == "Pairs"
      CardController.show_played
    elsif user_input == "Help"
      CLIController.help_menu
    elsif user_input == "Exit"
      puts "Thanks for playing! Have a nice day."
      exit
    elsif Card.number_array.include?(user_input)
      current_player.ask_and_take(user_input)
      Game.current_game.other_player.check_for_empty
      PlayerController.show_hand(current_player)
      turn_over = true
    else
      invalide_command = GameInvalidCommand.new
      invalide_command.render
    end
  end
end

def create_game
  Game.new
end

def get_user_input
  user_input = gets.chomp.downcase.capitalize.strip
end

def turn(current_player)
  puts "<>< ><> <>< ><>"
  PlayerController.show_hand(current_player)
  user_logic(current_player)
  # 2.times {current_player.find_matching}
  PlayerController.play_matching(current_player)
  current_player.check_for_empty
  puts "#{current_player.name}: #{current_player.score}."
  puts "#{Game.current_game.other_player.name}: #{Game.current_game.other_player.score}."
  puts "<>< ><> <>< ><>"
end

CLIController.greeting
PlayerController.create_users
CLIController.help_menu
game = create_game

## THIS IS THE MAIN LOOP OF THE GAME!! ##
until game.game_over?
  turn(game.current_player)
  game.switch_player
end
