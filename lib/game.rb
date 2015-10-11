#suggestions
#build the game_over? method into the CLI to determine if game is over. 
#should a game be able to reset itself? If so, what is it resetting? 

class Game
  attr_accessor :current_player, :over, :winner, :player_order, :other_player
  
  @@current_game = nil

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
    # should this be in the initialization of Game? So, CLI would call Game.new
    # new game kicks off game
    # commences gameplay (calls build_player_order)

    @player_order = build_player_order
    deal_cards
    @current_player = player_order.first
    @other_player = player_order.last
    @@current_game = self
  end

  def self.current_game
    @@current_game
  end

  def check_score
    other_player.score >= 3
  end

  def check_deck
    Card.unplayed_deck.length == 0
  end

  def game_over?
    ##??? encapsulate check_score and check_deck? 
    if check_deck
      over = true
    elsif check_score
      @winner = other_player
      puts "WE HAVE A WINNER! GAME OVER."
      puts "#{@winner.name} wins with a score of #{@winner.score}"
      over = true
    end
  end

  def switch_player
    if @current_player == player_order[0]
      @current_player = player_order[1]
      @other_player = player_order[0]
    elsif @current_player == player_order[1]
      @current_player = player_order[0]
      @other_player = player_order[1]
    end
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

