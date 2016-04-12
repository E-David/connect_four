require_relative "./connect_four/cell.rb"

module ConnectFour
	require_relative "./connect_four/cell.rb"
	require_relative "./connect_four/board.rb"
	require_relative "./connect_four/player.rb"
	require_relative "./connect_four/core_extensions.rb"
	require_relative "./connect_four/game.rb"
end



puts "Welcome to connect four!"
game = ConnectFour::Game.new