class Array
	def all_full?
		!self.any? { |ele| ele.to_s == "" }
	end

	def match_four?
		tokens = self.uniq
		tokens
		tokens.each do |token|
			unless token == ""
				return true if self.join(",").include?("#{token},#{token},#{token},#{token}")
			end
		end
		return false
	end

	def merge_horizontally
		rows = []
		row = 0
		until row == self.length
			rows << self[row]
			row += 1
		end
		return rows
	end

	def merge_vertically
		columns = []
		column = 0
		until column == self.first.length
			empty_array = []
			self.each { |row| empty_array << row[column] }
			columns << empty_array
			column += 1
		end
		return columns
	end

	def merge_diagonally
		diagonals = []
		self.each_with_index do |r, index|
			row = index
			r.each_with_index do |ele, index|
				diagonals << slant_left(self, row, index) if slant_left(self, row, index) != false
				diagonals << slant_right(self, row, index) if slant_right(self, row, index) != false
			end
		end
		return diagonals
	end

	def slant_left(array, row, column)
		empty_array = []
		until column == array.first.length || row == array.length
			empty_array << array[row][column]
			column += 1
			row += 1
		end
		return empty_array if empty_array.size == 4
		false
	end

	def slant_right(array, row, column)
		empty_array = []
		until column < 0 || row == array.length
			empty_array << array[row][column]
			column -= 1
			row += 1
		end
		return empty_array if empty_array.size == 4
		false
	end
end