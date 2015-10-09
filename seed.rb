Player.new("Stevesie", 14)
Player.new("Smantha",16)

game = Game.new

2.times do
  Player.all.each do |player|
    player.find_matching
  end
end

