#!usr/bin/env ruby
require_relative '../config/environment.rb'
require_relative '../lib/card_class.rb'
require_relative '../lib/player.rb'
#require_relative '../lib/computer.rb'
require_relative '../lib/game.rb'


require 'pry'

def reload!
  load 'lib/card_class.rb'
  load 'lib/player.rb'
  # load 'lib/computer.rb'
  load 'lib/game.rb'
end


Pry.start

foo = 3