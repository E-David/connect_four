require "spec_helper.rb"
module ConnectFour
	describe Player do
		let(:player1) { Player.new( "Tim", 2 ) }
		let(:player2) { Player.new( "Olley", "O") }

		context "#initialize" do
			it { expect(player1.name).to eq "Tim" }
			it { expect(player1.token).to eq "2" }
			it { expect(player2.name).to eq "Olley" }
			it { expect(player2.token).to eq "O" }
		end
	end
end