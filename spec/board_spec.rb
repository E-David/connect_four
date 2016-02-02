require "spec_helper.rb"
module ConnectFour
	describe Board do 
		let(:board) { Board.new }
		let(:covered_board) { ([["", "", ""], ["", "", "something"], ["", "", ""]]) } 

		context "#initialize" do
			it { expect(board.cells.count).to eq 3 }

			it "has the correct row count" do
				board.cells.each { |row| expect(row.count).to eq 3 }
			end
		end

		context "#get_cell" do
			it "gives the specified output" do
				board.cells = covered_board
				expect(board.get_cell(1,2)).to eq 'something'
			end
		end

		context "#set_cell" do
			it "changes the specified output if cell is not filled" do
				board.set_cell(0,0,'X')
				expect(board.get_cell(0,0).value).to eq 'X'
			end
		end

		context "#display_board" do
			it "gives a formatted list of arrays in a board format" do
				expect(board.cells.each { |row| p row}.count).to eq 3
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
				expect(board.game_over).to eq false
			end
		end
	end
end