#variables needed
#Need list of *all* players of game (to iterate over)
#Need access to Card.unplayed_deck

#need to double check accessors and class variable notation 

#suggestions
#build the game_over? method into the CLI to determine if game is over. 
#game play stops when the game is over.
#can make this a loop and check if the game is over after every turn. 
#should a game be able to reset itself? If so, what is it resetting? 

class Game
  attr_accessor :current_player, :over, :winner, :player_order
 
  def build_player_order 
    #based on age, youngest to oldest
    #looks at all players of game, sorts by age. Should return an array. 
    #when player is initiated, should be added to the game?
    Player.all.sort_by{|player| player.age}
  end
 
  def deal_cards
    5.times do 
      Player.all.each do |player|
        player.draw
        #The player should draw a card from the deck and add it to their hand
        #deals out 5 cards to each player 
      end
    end
  end

  def initialize
    #should this be in the initialization of Game? So, CLI would call Game.new
    #new game kicks off game
    #commences gameplay (calls build_player_order)

    @player_order = build_player_order
    deal_cards
    current_player = player_order.first
  end


  def check_score
    current_player.score >= 10
  end

  def check_deck
    Card.unplayed_deck.length == 0
  end

  def game_over?
    ##??? encapsulate check_score and check_deck? 
    if check_deck
      over = true
    elsif check_score
      winner = current_player
      puts "#{@winner} wins with a score of #{@winner.score}"
      over = true
    end
  end

  def next_player
    #iterate through the array of players. 
    # if we reach the end, reset at 0 and start
    turn = player_order.index(current_player)
    if turn + 1 >= player_order.length
      turn = 0
    else
      turn += 1
    end
    current_player = player_order[turn]
  end 

  # def reset_game
    
  # end
end


#require 'pry'


#tests 
# class Player
#   attr_accessor :name, :age, :score

#   def initialize(name, age)
#     @name = name
#     @age = age
#     @score = nil
#     self.class.all << self
#   end

#   def self.all
#     @@all ||= []
#   end

# end

# Pry.start

# class Card
#   attr_reader :num, :suit

#   def initialize
#   end

# end

