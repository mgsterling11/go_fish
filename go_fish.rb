runner_file CLI

while score <=10
environment
instructions -- user_interface stuff
case statement # of players, player names, player_age, order_players_by_age)
starts_game_play
start_turn
ask_and_take (human or computer)
next_player_turn, #gives player name as output for whose turn it is
ask_and_take (human or computer)
...until @score >=10
end
announce_winner



class Game
  @current_player = player
  @score

  def check_score
     #check_for_ten (@current_player)
     if >=10 
  end

  def check_deck
  end

  def new_game
    #new game kicks off game
    #commences gameplay (calls build_player_order)
  end

  def next_player_turn
    # if @current_player == player1
    #   @current_player = player2
  end 

  def reset_game
  end

  def build_player_order #based on age, youngest to oldest
  end

  def deal_cards
    5.times do players.all.each draw
  end

end 



class Card
  @@unplayed_deck = [starts with 52 card objects]
  DECK = [filled with 52 card objects]
  @@played =[card objects]
  @number
  @suit 

  def build_deck
  end
end


class Player
  @hand =[]
  @score
  @@players = []
  @player_name
  @player_age

  attr_accessor :hand

  def draw
    #draws one at a time >> can be used at beginning of game and during game
  end

  def ask_and_take(card, player)
    #person asks, if other player has card, player gives card to person
    #takes
    #check_for_pair
  end 

  def check_for_pair
   
  end

  def check_for_empty
    #5.times draw, updates @hand
  end

end



class Computer < Player

  def know_played_cards
    #checks played cards deck against its own hand and guesses 
  end

  def select_player
    #asks the person with the most cards
    # >> @@players.each @hand.length
  end

  def select_card_to_play
    #know_played_cards
  end

  def computer_move
    #select_player 
    #select_card_to_play
    #ask_and_take(card, player)
  end
end









