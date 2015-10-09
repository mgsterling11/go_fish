def Computer < Person

  def select_player
    self.class.all.max_by {|player| player.hand.length}
  end

  def select_card_to_play

  end

end