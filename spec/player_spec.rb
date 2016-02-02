require "spec_helper.rb"
module ConnectFour
	describe Player do
		let(:player1) { Player.new }
		let(:player2) { Player.new("O") }

		context "#initialize" do
			it { expect(player1.token).to eq "X" }
			it { expect(player2.token).to eq "O" }
		end
	end
end