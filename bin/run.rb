#!usr/bin/env ruby
require_relative '../config/environment.rb'



require 'pry'

def reload!
  load 'lib/card_class.rb'
  load 'lib/player.rb'
  # load 'lib/computer.rb'
  load 'lib/game.rb'
  load 'seed.rb'
end
  
  def greeting
    puts "Welcome to Go Fish!"
  end

  def help_menu
    puts "Here are your options: "
    puts "ask - if your opponent for a card"
    puts "score - check the score"
    puts "pairs - display all played cards on the table"
    puts "help - display this menu at any time"
    puts "exit - exit the game"
  end 

  def user_logic(current_player)
    puts "#{current_player.name}, what would you like to do?"     
    user_input = get_user_input 
    case user_input
      when "ask"
        puts "What card would you like to ask for?"
        number = gets.chomp.downcase.capitalize.strip
        if Card.number_array.include?(number)
          current_player.ask_and_take(number)
          Game.current_game.other_player.check_for_empty
          show_hand(current_player)
        else
          puts "I'm sorry, that's not a valid card to ask for"
          user_logic(current_player)
        end
      when "score"
        puts "#{current_player.name}, your score is: #{current_player.score}."
        # puts "#{other_player.name}, your score is: #{current_player.score}."
        user_logic(current_player)
      when "pairs"
        print "#{Card.played.sort}."
      when "help"
        help_menu
        user_logic(current_player)
      when "exit"
        puts "Thanks for playing! Have a nice day."
        exit
      else 
        puts "Invalid command"

        puts user_logic(current_player)
      end     
  end

  def create_users
    puts "Player 1: What is your name?"
    player_1_name = gets.chomp
    puts "What is your age?"
    player_1_age = gets.chomp
    Player.new(player_1_name, player_1_age)

    puts "Player 2: What is your name?"
    player_2_name = gets.chomp
    puts "What is your age?"
    player_2_age = gets.chomp
    Player.new(player_2_name, player_2_age)
  end

  def create_game
    Game.new
  end

  def show_hand(player)
    puts "#{player.name}, this is your hand:"
    player.hand.each do |card|
      print "#{card.number} of #{card.suit}s. "
    end
    print "\n \n"
  end

  def get_user_input
    user_input = gets.chomp.downcase.strip
  end

  # system 'clear' << 

  def turn(current_player)
    puts "<>< ><> <>< ><>"
    show_hand(current_player)
    # help_menu
    user_logic(current_player)
    current_player.find_matching
    current_player.check_for_empty
    puts "#{current_player.name}: #{current_player.score}."
    puts "#{Game.current_game.other_player.name}: #{Game.current_game.other_player.score}."

    puts "<>< ><> <>< ><>"
    # system 'clear'
  end

greeting
create_users
help_menu
game = create_game

until game.game_over?
  turn(game.current_player)
  game.switch_player
end


