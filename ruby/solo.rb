# Define monster class
#
# Attributes:
# @name = string
# @level = integer
# @health = integer
# @damage = integer
#
# Methods:
# initialize(name=string, health=integer, damage=integer) = creates a new monster
# attack = monster attacks the player
# take_damage(damage=integer) = monster takes damage
# die = monster dies

class Monster
	attr_reader :name, :damage
	attr_accessor :health
	def initialize(name, health, damage)
		@name = name
		@health = health
		@damage = damage
	end
	# attack attempts to hit the player, returns damage inflicted
	def attack
		if swing
			hit = rand(@damage) + 1
			puts "The #{@name} hits you for #{hit} damage. "
			return hit
		else
			puts "The #{@name} misses you. "
			return 0
		end
	end
	# take_damage inflicts damage on the monster
	def take_damage(damage)
		@health -= damage
	end
	def die
		"The #{name} falls to the ground. "
	end
end

def swing
	rand(3) > 0
end

# Main
puts "Welcome to the Arena!"
puts

# Get list of monsters
puts "You must enter a list of monsters you want to fight.
For each monster, enter the name of the monster, the amount of
health it has, and the damage it inflicts. Enter 'done' as a
name when you're done. "
puts
monster_list = []
name = ""
# Input loop
while name != "done"
	name = ""
	while name == ""
		puts
		print "Enter monster name, or 'done' if done: "
		name = gets.chomp
	end
	if name != "done"
		health = 0
		while health < 1 || health > 50
			print "Enter monster health (1-50): "
			health = gets.chomp.to_i
		end
		damage = 0
		while damage < 1 || damage > 20
			print "Enter monster damage (1-20): "
			damage = gets.chomp.to_i
		end
		monster_list << Monster.new(name, health, damage)
	end
end

# Print out list of monsters
puts
if monster_list.empty?
	puts "You won't be fighting any monsters today, then? "
else
	puts "Here is a list of the monsters you will be fighting today: "
	puts
	puts "MONSTER\tHEALTH\tDAMAGE"
	monster_list.each do |monster|
		puts "#{monster.name}\t#{monster.health}\t#{monster.damage}"
	end
end

## The Arena

# Initialize player stats
player_health = 100
player_damage = 20

# Main loop
count = 0
while player_health > 0 and count < monster_list.length
	# Get the next monster in the list
	puts
	puts "You have #{player_health} health left. "
	print "Press enter to fight the next monster..."
	gets.chomp
	m = monster_list[count]
	puts "You are fighting one #{m.name}."
	# Fight as long as both are alive
	while player_health > 0 and m.health > 0
		# Player attacks monster
		print "You swing at the #{m.name} "
		if swing
			d = rand(player_damage) + 1
			puts "and hit for #{d} damage. "
			m.take_damage(d)
		else
			puts "and miss."
		end
		# Check whether monster is still alive
		if m.health <= 0
			m.die
		else
			# If so, monster attacks player
			player_health -= m.attack
		end

	end
	# Check whether the player is still alive
	if player_health > 0
		puts "You defeated the #{m.name}!"
	else
		puts
		puts "You have been slain!  Better luck next time. "
	end
	count += 1
end

# If player made it out alive, congratulate the player
if player_health > 0
	puts
	puts "Congratulations, you have defeated all of the monsters! "
end