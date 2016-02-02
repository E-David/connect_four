require "spec_helper.rb"
module ConnectFour
	describe Game do
		let(:game) { Game.new }

		context "#initialize" do
			it { expect(game.board).to eq(Board.new) }
		end
	end
end