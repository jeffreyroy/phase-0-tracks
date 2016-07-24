# Chess opening explorer

require 'sqlite3'

# Search for a key with a string value and return corresponding id
def find_string(db, table, key, string)
	id_array = db.execute("SELECT id FROM #{table} WHERE #{key}=\"#{string}\"")

	# Check to see if given move from this position is already defined
	# If not defined, return nil
	if id_array.empty?
		return nil
	end
	if id_array.length > 1
		puts "ERROR!  Multiple matches for key #{key} and value '#{string}'!"
		return nil
	end
	# If string is found, return its id
	return id_array[0]["id"]
end

# return_value
# finds record for given id, then returns value associated with key
def return_value(db, table, id, key)
	value_array = db.execute("SELECT #{key} FROM #{table} WHERE id=#{id}")

	# Check to see if given move from this position is already defined
	# If not defined, return nil
	if value_array.empty?
		return nil
	end
	if value_array.length > 1
		puts "ERROR!  Multiple matches for id #{id}!"
		return nil
	end
	# If id is found, return value associated with key
	return value_array[0][key]
end

# find_max_id
# Find the maximum existing unique identifier in a table
# We need to do this to avoid duplicating IDs
def find_max_id(db, table)
	# Get list of ids
	id_array = db.execute("SELECT id FROM #{table}")
	# Loop through list, checking for the highest number id
	max_id = 0
	id_array.each do |cur_id|
		if cur_id["id"] > max_id
			max_id = cur_id["id"]
		end
	end
	# Return the highest number found
	return max_id
end

# show_position
# Display information about the current position
def show_position(db, id, move_list)
	position_array = db.execute("SELECT * FROM positions WHERE id=#{id}")
	# Check to make sure a position exists for the given id
	if position_array.empty?
		puts "ERROR!  Position ID not found"
		return nil
	end
	if position_array.length > 1
		puts "ERROR!  Non-unique opening ID"
		return nil
	end
	# Display information
	position_hash = position_array[0]
	puts "Current opening:  #{position_hash["eco"]} - #{position_hash["name"]}"
	puts "Moves so far: #{move_list.join(' ')}"
	known_move_array = db.execute("SELECT move FROM moves WHERE from_id=#{id}")
	if known_move_array.empty?
		puts "No moves known from this position."
	else
		puts "Known moves from this position:"
		known_move_array.each do |cur_move|
			puts cur_move["move"]
		end
	end
end

# find_move
# attempts to locate a given move in the database
# returns id if found, otherwise returns nil
def find_move(db, position_id, move)
	try_move = db.execute("SELECT id FROM moves WHERE from_id=#{position_id} AND move='#{move}'")
	# Check to see if given move from this position is already defined
	# If not defined, return nil
	if try_move.empty?
		return nil
	end
	if try_move.length > 1
		puts "ERROR!  Multiple moves with same name!"
		return nil
	end
	# If move is known, return its id
	return try_move[0]["id"]
end

# input_move
# Allows user to enter a move or command
# Should be updated to check whether move is legal
# For now it accepts any input as a "move"
def input_move
	print "Enter a move in standard chess notation: "
	move = gets.chomp.downcase
	return move
end



# open the openings database
db = SQLite3::Database.new("openings.db")
db.results_as_hash = true

cur_pos_id = find_max_id(db, "positions")

cur_move_id = find_max_id(db, "moves")


# Begin at starting position
cur_position = 1
move_list = []

# main loop
done = false
while !done
	puts
	show_position(db, cur_position, move_list)
	next_move = input_move
	m = find_move(db, cur_position, next_move)
	if next_move == "quit"
		# Exit the program
		done = true
	elsif next_move == "undo"
		# Undo a move
		if move_list.empty?
			puts "No moves have been made yet!"
		else
			move = move_list[-1]
			# Find previous position
			from_id_array = db.execute("SELECT from_id FROM moves WHERE to_id=#{cur_position} AND move='#{move}'")
			if from_id_array.empty? || from_id_array.length > 1
				puts "ERROR!  Can't find previous position!"
			else
				puts "Undoing one move..."
				# Return to previous position
				cur_position = from_id_array[0]["from_id"]
				# Remove last move from list
				move_list.pop
			end
		end

	elsif !m
		puts "I don't know that move."
		print "Do you want to enter it as a new move (y/n)? "
		answer = gets.chomp.downcase
		if answer == "y"
			# Input info for new position
			puts "Creating new position for the move #{next_move}: "
			print "Enter the name for this opening: "
			name = gets.chomp
			print "Enter the ECO code for this opening, if known: "
			eco = gets.chomp
			puts
			puts "I'm about to create a new entry for the move #{next_move}."
			puts "The opening will be #{eco} - #{name}."
			print "Are you sure you want to proceed (y/n)?"
			answer = gets.chomp.downcase
			if answer == "y"
				# Create dabase entries
				whites_move_before = return_value(db, "positions", cur_position, "white_to_move")
				if whites_move_before == "true"
					whites_move_now = "false"
				else
					whites_move_now = "true"
				end
				cur_pos_id += 1
				cur_move_id += 1
				db.execute("INSERT INTO positions (id, name, eco, white_to_move) VALUES (#{cur_pos_id}, '#{name}', '#{eco}', '#{whites_move_now}')")
				db.execute("INSERT INTO moves (id, from_id, to_id, move) VALUES (#{cur_move_id}, #{cur_position}, #{cur_pos_id}, '#{next_move}')")
				move_list << next_move
				cur_position = cur_pos_id
			end
		end
	else
		# Advance to next position
		move_list << next_move
		next_position = return_value(db, "moves", m, "to_id")
		if next_position
			cur_position = next_position
		else
			puts "ERROR - Next position not found!"
		end
	end
end
puts
puts "Goodbye!"