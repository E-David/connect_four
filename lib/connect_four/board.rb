module ConnectFour
	class Board
		attr_accessor :cells, :columns
		def initialize(layout = "")
			@cells = create_board
			@columns = columns
		end

		def convert_to_column(column_num)
			column = []
			cells.each do |row| 
				row.each_with_index do | cell, column_number | 
					column << cell if column_number == column_num
				end
			end
			return column
		end

		def find_open_cell(column_num)
			column = convert_to_column(column_num)
			x = []
			column.each_with_index { |cell, index| x << index if cell.value == ""}
			return x.max
		end

		def get_cell(column_num)
			row_num = find_open_cell(column_num)	
			cells[row_num][column_num]
		end

		def set_column(column_num, token)
			get_cell(column_num).value = token
		end

		def valid_move?(input)
			column = convert_to_column(input)
			values = []
			column.each { |cell| values << cell.value }
			values.all_full? ? false : true
		end

	    def display_board
	    	cells.each do |row|
	        	puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join(" ")
	        end
	    end

		def game_over
			return :winner if winner?
			return :draw if draw?
			false
		end

		def winner?
			values1 = []
			values2 = []
			values3 = []
			cells.merge_horizontally.each { |h| h.each { |s| values1 << s.value } }
			cells.merge_vertically.each { |v| v.each { |s| values2 << s.value } }
			cells.merge_diagonally.each { |d| d.each { |s| values3 << s.value } }
			values1.match_four? || values2.match_four? || values3.match_four?
		end

		def draw?
			values = []
			cells.each { |row| row.each { |cell| values << cell.value } }
			values.all_full?
		end

		private

		def create_board
			Array.new(6) { Array.new(7) { Cell.new } }
		end
	end
end