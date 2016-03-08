require "spec_helper.rb"
module ConnectFour
	describe Board do 
		let(:board) { Board.new }
		let(:x_cell) { Cell.new("X") }
		let(:o_cell) { Cell.new("O") }
		let(:empty_cell) { Cell.new }
		let(:empty_board) { Array.new(6) { Array.new(7) { Cell.new } } }
		let(:covered_board) {  [[empty_cell, empty_cell, empty_cell, empty_cell, empty_cell, empty_cell, empty_cell],
								[empty_cell, empty_cell, x_cell, empty_cell, empty_cell, empty_cell, empty_cell],
								[empty_cell, empty_cell, x_cell, empty_cell, empty_cell, empty_cell, empty_cell],
								[empty_cell, empty_cell, x_cell, empty_cell, empty_cell, empty_cell, empty_cell],
								[empty_cell, empty_cell, x_cell, empty_cell, empty_cell, empty_cell, empty_cell],
								[empty_cell, empty_cell, x_cell, empty_cell, empty_cell, empty_cell, empty_cell]]
							} 
		let(:draw_board) 	{  [[x_cell, o_cell, o_cell]] } 	
		let(:win_board) 	{  [[empty_cell, empty_cell, empty_cell, empty_cell, empty_cell, empty_cell, empty_cell],
								[empty_cell, empty_cell, empty_cell, empty_cell, empty_cell, empty_cell, empty_cell],
								[o_cell, o_cell, o_cell, x_cell, x_cell, o_cell, x_cell],
								[x_cell, x_cell, x_cell, o_cell, o_cell, x_cell, o_cell],
								[o_cell, x_cell, o_cell, x_cell, x_cell, x_cell, o_cell],
								[x_cell, x_cell, x_cell, o_cell, o_cell, o_cell, x_cell]]
							} 									

		context "#initialize" do
			it "has the correct row count" do
				expect(board.cells.count).to eq 6
			end

			it "has the correct column count" do
				board.cells.each { |row| expect(row.count).to eq 7 }
			end
		end

		context "#convert_to_column" do
			it "returns column based on numbered input given" do
				board.cells = [[1,2,3],[2,4,6]]
				expect(board.convert_to_column(0)).to eq [1,2]
			end
		end

		context "#find_open_cell" do
			it "finds the first empty cell value" do
				column = [Cell.new("X"), Cell.new, Cell.new("X")]
				allow(board).to receive(:convert_to_column) { column }
				expect(board.find_open_cell(0)). to eq 1
			end
		end

		context "#get_cell" do
			it "returns the first open cell from bottom row" do
				board.cells = [[Cell.new("X"), Cell.new, Cell.new("X")]]
				allow(board).to receive(:find_open_cell) { 0 }
				expect(board.get_cell(0).value).to eq "X"
			end
		end

		context "#set_column" do
			it "changes the specified output if column is not filled" do
				board.cells = [[Cell.new("X"), Cell.new, Cell.new("X")]]
				board.set_column(1, "O")
				expect(board.cells[0][1].value).to eq 'O'
			end
		end

		context "#valid_move?" do
			it "returns true if column isn't full with valid input" do
				board.cells = [[Cell.new("X"), Cell.new, Cell.new("X")],[Cell.new("X"), Cell.new("O"), Cell.new("X")]]
				expect(board.valid_move?(1)).to be_truthy
			end

			it "returns false if column is full" do
				board.cells = [[Cell.new("X"), Cell.new("O"), Cell.new("X")]]
				expect(board.valid_move?(0)).to be_falsey
			end

			it "returns false if input is too high" do
				board.cells = [[Cell.new("X"), Cell.new, Cell.new("X")]]
				expect(board.valid_move?(3)).to be_falsey
			end

			it "returns false if input is too high" do
				board.cells = [[Cell.new("X"), Cell.new, Cell.new("X")]]
				expect(board.valid_move?(-1)).to be_falsey
			end
		end

		context "#display_board" do
			it "gives a formatted list of arrays in a board format" do
				expect(board.display_board.count).to eq 6
			end
		end

		context "#game_over" do
			it "returns win condition" do
				allow(board).to receive(:winner?) { true }
				expect(board.game_over).to eq :winner
			end

			it "returns draw condition" do
				allow(board).to receive(:winner?) { false }
				allow(board).to receive(:draw?) { true }
				expect(board.game_over).to eq :draw
			end

			it "returns false if neither condition is fulfilled" do
				allow(board).to receive(:winner?) { false }
				allow(board).to receive(:draw?) { false }
				expect(board.game_over).to be_falsey
			end
		end

		context "#winner?" do
			it "returns true if there is a winning position" do
				board.cells = win_board
				expect(board.winner?).to be_truthy
			end

			it "returns false if there is no winning position" do
				board.cells = draw_board
				expect(board.winner?).to be_falsey
			end

			it "returns false if the board is empty" do
				board.cells = empty_board
				expect(board.winner?).to be_falsey
			end
		end

		context "#draw?" do
			it "returns true if grid is filled with no valid moves" do
				board.cells = draw_board
				expect(board.draw?).to be_truthy
			end

			it "returns false if grid is not full" do
				board.cells = win_board
				expect(board.draw?).to be_falsey
			end

			it "returns false if grid is blank" do
				board.cells = empty_board
				expect(board.draw?).to be_falsey
			end
		end
	end
end