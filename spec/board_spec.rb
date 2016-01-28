require "spec_helper.rb"
module ConnectFour
	describe Board do 
		let(:board) { Board.new }
		let(:covered_board) { ([["", "", ""], ["", "", "something"], ["", "", ""]]) } 

		context "on start" do
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
	end
end