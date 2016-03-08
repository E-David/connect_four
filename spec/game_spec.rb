require "spec_helper.rb"
module ConnectFour
	describe Game do
		let(:fred) { Player.new("Fred", "x") }
		let(:brian) { Player.new("Brian", "O") }
		let(:game) { Game.new([brian,fred]) }

		context "#initialize" do
			it "randomly selects a current player" do
				allow_any_instance_of(Array).to receive(:shuffle).and_return([fred, brian])
				expect(game.current_player).to eq (fred)
			end

			it "randomly select an other player" do
				allow_any_instance_of(Array).to receive(:shuffle).and_return([fred, brian])
				expect(game.other_player).to eq (brian)
			end
		end

		context "#switch_player" do
			it "switches current_player with other_player" do
				current_player = game.current_player
				game.switch_player
				expect(game.other_player).to eq current_player
			end

			it "switches other_player with current_player" do
				other_player = game.other_player
				game.switch_player
				expect(game.current_player).to eq other_player
			end
		end

		context "#solicit_move" do
			it "asks the current player for input" do
				allow(game).to receive(:current_player) { brian }
				expected = "Brian, choose a column:"
				expect(game.solicit_move).to eq expected
			end
		end

		context "#get_move" do
			it { expect(game.get_move("0")).to eq 0 }
		end

		context "game_over_message" do
			it "sends winner message with player name" do
				allow(game).to receive(:current_player) { brian }
				allow(game.board).to receive(:game_over) { :winner }
				expect(game.game_over_message).to eq "Brian wins!"
			end

			it "sends draw message when board ends in a draw" do
				allow(game).to receive(:current_player) { brian }
				allow(game.board).to receive(:game_over) { :draw }
				expect(game.game_over_message).to eq "Tie Game!"
			end
		end
	end
end