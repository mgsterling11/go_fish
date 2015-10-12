#!usr/bin/env ruby
require_relative '../config/environment.rb'

require 'pry'

def user_logic(current_player, other_player)
  turn_over = false
  until turn_over
    CurrentPlayerMessage.new.render
    user_input = get_user_input
    if user_input == "Score"
      ViewScore.new.render
    elsif user_input == "Pairs"
      CardController.show_played
    elsif user_input == "Help"
      CLIHelpMenu.new.render
    elsif user_input == "Exit"
      puts "Thanks for playing! Have a nice day."
      exit
    elsif Card.number_array.include?(user_input)
      take_card = PlayerController.new.ask_for_card(other_player, user_input)
      # current_player.ask_and_take(user_input, other_player)
      PlayerController.new.take_card(take_card, current_player, other_player, user_input) if take_card
      other_player.check_for_empty
      PlayerController.show_hand(current_player)
      turn_over = true
    else
      GameInvalidCommand.new.render
    end
  end
end

def create_game
  Game.new
end

def get_user_input
  user_input = gets.chomp.downcase.capitalize.strip
end

def turn(current_player, other_player)
  InsertFish.new.render
  PlayerController.show_hand(current_player)
  user_logic(current_player, other_player)
  # 2.times {current_player.find_matching}
  PlayerController.play_matching(current_player)
  current_player.check_for_empty
  ViewScore.new.render
  GameController.new.long_pause
  GameController.new.clear
  InsertFish.new.render
end


#Actions 
CLIGreeting.new.render
PlayerController.create_users
CLIHelpMenu.new.render
game = create_game
game.start_game

## THIS IS THE MAIN LOOP OF THE GAME!! ##
until game.game_over?
  turn(game.current_player, game.other_player)
  game.switch_player
end
