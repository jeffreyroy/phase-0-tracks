# Chess opening explorer

require 'sqlite3'

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



# open the openings database
db = SQLite3::Database.new("openings.db")
db.results_as_hash = true

cur_pos_id = find_max_id(db, "positions")

cur_move_id = find_max_id(db, "moves")

# Begin at starting position
cur_position = 1
move_list = []
show_position(db, cur_position, move_list)
