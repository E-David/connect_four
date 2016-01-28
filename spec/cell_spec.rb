require "spec_helper.rb"

module ConnectFour
	describe Cell do
		let(:cell) {Cell.new}
		let(:occupied_cell) {Cell.new('X')}

		it { expect(cell.value).to eq('') }
		it { expect(occupied_cell.value).to eq('X') }
	end		
end