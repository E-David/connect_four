module ConnectFour
	class Board
		attr_accessor :cells
		def initialize
			@cells = create_board
		end

		def get_cell(x, y)
			cells[x][y]
		end

		def set_cell(x, y, piece)
			get_cell(x, y).value = piece
		end

		def game_over
			return :winner if winner?
			return :draw if draw?
			false
		end

		private

		def create_board
			Array.new(3, Array.new(3, Cell.new))
		end
	end
end