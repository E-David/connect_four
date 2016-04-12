module ConnectFour
	class Game
		attr_reader :board, :players, :current_player, :other_player
		def initialize(board = Board.new)
			@board = board
			@players = get_players
			@current_player,@other_player = players.shuffle
			play_game
		end

		def get_players
			puts "Player 1, please type your name:"
			a = gets.chomp
			puts "Player 2, please type your name:"
			b = gets.chomp
			return [ConnectFour::Player.new(a,"X"), ConnectFour::Player.new(b,"O")]
		end

		def switch_player
			@current_player,@other_player = @other_player,@current_player
		end

		def solicit_move
			p "#{current_player.name}, choose a column:"
		end

		def get_move
			while move = gets
				if move.match(/\d/)
					return move.to_i
					break
				else
					puts "Numbers only please."
				end
			end
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

x = "f"
p x