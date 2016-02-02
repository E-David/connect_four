module ConnectFour
	class Game
		attr_reader :board
		def initialize(board = Board.new)
			@board = board
		end
	end
end