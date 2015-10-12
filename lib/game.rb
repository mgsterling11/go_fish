class Game
  attr_accessor :current_player, :over, :winner, :player_order, :other_player
  
  @@current_game = nil

  def initialize
    @@current_game = self
  end

  def self.current_game
    @@current_game
  end

  def players
    @players ||= []
  end

  def build_player_order 
    Player.all.sort_by{|player| player.age}
  end
 
  def deal_cards
    5.times do 
      Player.all.each do |player|
        player.draw
      end
    end
  end

  def start_game
    puts "Super, let's begin."
    puts
    @player_order = build_player_order
    deal_cards
    @current_player = player_order.first
    @other_player = player_order.last
  end

  def check_score
    other_player.score >= 3
  end

  def check_deck
    Card.unplayed_deck.length == 0
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

  def game_over?
    ##??? encapsulate check_score and check_deck? 
    if check_deck
      over = true
    elsif check_score
      @winner = other_player
      GameWinnerAnnounce.new.render  
      over = true
    end
  end


  # def reset_game
    
  # end
end
