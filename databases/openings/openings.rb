# Chess opening explorer

require 'sqlite3'

## Methods
=begin
# Search for a key with a string value and return corresponding id
def find_string(db, table, key, string)
	id_array = db.execute("SELECT id FROM #{table} WHERE #{key}=\"#{string}\"")

	# Check to see if given move from this position is already defined
	# If not defined, return nil
	if id_array.empty?
		return nil
	end
	if id_array.length > 1
		puts "ERROR!  Multiple matches for key #{key} and value \"#{string}\"!"
		return nil
	end
	# If string is found, return its id
	return id_array[0]["id"]
end
=end

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
	puts position_hash["comment"]
	print "Moves so far: "
	# puts {move_list.join(' ')
	display_moves(move_list)
	puts
	known_move_array = db.execute("SELECT move FROM moves WHERE from_id=#{id}")
	if known_move_array.empty?
		puts "No moves known from this position."
	else
		puts "Known moves for #{cur_player(db, id)} from this position:"
		known_move_array.each do |cur_move|
			puts cur_move["move"]
		end
	end
end

# find_move
# attempts to locate a given move in the database
# returns id if found, otherwise returns nil
def find_move(db, position_id, move)
	try_move = db.execute("SELECT id FROM moves WHERE from_id=#{position_id} AND move=\"#{move}\"")
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
def input_move(db, cur_position)
	print "Enter a move for #{cur_player(db, cur_position)} in standard chess notation, or HELP for help: "
	move = gets.chomp.downcase
	return move
end

# cur_player
# Returns the name of the player whose move it is in cur_position
def cur_player(db, cur_position)
	whites_move = db.execute("SELECT white_to_move FROM positions WHERE id=#{cur_position}")
	if whites_move[0]["white_to_move"] == "true"
		return "white"
	else
		return "black"
	end
end

# display_moves
# Prints out the moves made so far in a user-friendly format
def display_moves(move_list)
	turns = (move_list.length + 1) / 2
	if turns > 0
		for count in 1..turns
			print " #{count}."
			print " #{move_list[2*count - 2]}"
			if 2*count <= move_list.length
				print " #{move_list[2*count - 1]}"
			end
		end
	else
		puts "(none)"
	end
end

def display_help
	puts
	puts "To move through the openings explorer, enter a move in algebraic
chess notation.  For example, enter e4 for white to move the King
Pawn forward two spaces.  For piece moves, enter the abbreviation
of the piece followed by the destination, e.g. Nf6 or Bg2.  For
castling, enter 0-0 for castling on the King's side, and 0-0-0 for
the Queen's side.

You can also enter one of the following commands:
HELP - displays this help file
UNDO - undoes the last move entered
QUIT - exits the program"
end

## Main

# Initialize variables to begin at starting position
db = SQLite3::Database.new("openings.db")
db.results_as_hash = true
cur_position = 1
move_list = []

# Find maximum id numbers used in our database
# We need to assign position ids by hand for tracking purposes
# We'll assign higher numbers to new positions to avoid duplicates
cur_pos_id = find_max_id(db, "positions")

# Intro message
puts "Welcome to the Chess Opening Explorer!

This app allows you to learn about chess openings by entering
a sequence of moves for white and black.  The app will tell you
name of opening you've entered, and also the opening code from the
Encyclopedia of Chess Openings (ECO).

Moves should be entered in algebraic chess notation [see
https://en.wikipedia.org/wiki/Algebraic_notation_(chess)].

Enter HELP at any time for help."

# main loop
done = false
while !done
	puts
	show_position(db, cur_position, move_list)
	next_move = input_move(db, cur_position)
	m = find_move(db, cur_position, next_move)
	if next_move == "quit"
		# Exit the program
		done = true
	elsif next_move == "help"
		# Print out help file
		display_help
	elsif next_move == "undo"
		# Undo a move
		if move_list.empty?
			puts "No moves to undo!"
		else
			move = move_list[-1]
			# Find previous position
			from_id_array = db.execute("SELECT from_id FROM moves WHERE to_id=#{cur_position} AND move=\"#{move}\"")
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
			puts "Enter a short comment about this opening (or press enter to leave blank):"
			comment = gets.chomp
			puts
			puts "I'm about to create a new entry for the move #{next_move}."
			puts "The opening will be #{eco} - #{name}."
			puts comment
			print "Are you sure you want to proceed (y/n)?"
			answer = gets.chomp.downcase
			if answer == "y"
				# Figure out whose move it is
				whites_move_before = return_value(db, "positions", cur_position, "white_to_move")
				if whites_move_before == "true"
					whites_move_now = "false"
				else
					whites_move_now = "true"
				end
				# Create new database entry
				cur_pos_id += 1
				db.execute("INSERT INTO positions (id, name, eco, white_to_move, comment) VALUES (#{cur_pos_id}, \"#{name}\", \"#{eco}\", \"#{whites_move_now}\", \"#{comment}\")")
				db.execute("INSERT INTO moves (from_id, to_id, move) VALUES (#{cur_position}, #{cur_pos_id}, \"#{next_move}\")")
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
puts "Thanks for using the Openings Explorer!"