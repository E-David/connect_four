# /example/example_game.rb

require_relative "../lib/connect_four.rb"
puts "Welcome to connect four!"
bob = ConnectFour::Player.new("Bob","X")
frank = ConnectFour::Player.new("Frank","O")
players = [bob, frank]
ConnectFour::Game.new(players).play_game