module ConnectFour
	class Game
		attr_reader :board, :players, :current_player, :other_player
		def initialize(players, board = Board.new)
			@board = board
			@players = players
			@current_player,@other_player = players.shuffle
		end

		def switch_player
			@current_player,@other_player = @other_player,@current_player
		end

		def solicit_move
			p "#{current_player.name}, choose a column:"
		end

		def get_move(move = gets.chomp)
			move.to_i
		end

		def game_over_message
			return "#{current_player.name} wins!" if board.game_over == :winner
			return "Tie Game!" if board.game_over == :draw 
		end

		def play_game
			p "#{current_player.name} has been randomly chosen to go first."
			while true
				board.display_board
				puts ""
				solicit_move
				while move = get_move
					if board.valid_move?(move)
						board.set_column(move, current_player.token)
						break
					else
						p "invalid move"
						solicit_move
					end
				end
				if board.game_over != false
					board.display_board
					p game_over_message
					return
				else
					switch_player
				end
			end
		end
	end
end