# Define monster class
#
# Attributes:
# @name = string
# @level = integer
# @health = integer
# @damage = integer
#
# Methods:
# attack = monster attacks the player
# take_damage = monster takes damage
# die = monster dies

class Monster
	attr_reader :name, :level, :attack_list
	attr_accessor :health
	def initialize(name, level)
		@name = name
		@level = level
		@health = level * 10
		@attack_list = []
	end
	def attack

	end
	def take_damage(damage)
		@health -= damage
	end
end