module ConnectFour
	class Player
		attr_reader :name, :token
		def initialize(name, token)
			@name = name
			@token = token.to_s
		end
	end
end