# Call method of pre-existing module
# puts Math.sqrt(4)

# Standalone module
=begin
module Shout
	def self.yell_angrily(words)
		words + "!!!" + ":("
	end
	def self.yell_happily(words)
		words + "! :)"
	end
end

puts Shout.yell_happily("I'm happy")
puts Shout.yell_angrily("I'm angry")
=end

# Mixin module
module Shout
	def yell_angrily(words)
		words + "!!!" + ":("
	end
	def yell_happily(words)
		words + "! :)"
	end
end

# Driver code
class Town_Crier
	include Shout
end

class Fan
	include Shout
end

fan = Fan.new
puts fan.yell_happily("Go Warriors")

crier = Town_Crier.new
puts crier.yell_angrily("Hear ye,hear ye")