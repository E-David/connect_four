module ConnectFour
	class Board
		attr_accessor :cells
		def initialize
			@cells = create_board
		end

		def get_cell(x, y)
			cells[x][y]
		end

		private

		def create_board
			Array.new(3, Array.new(3, Cell.new))
		end
	end
end