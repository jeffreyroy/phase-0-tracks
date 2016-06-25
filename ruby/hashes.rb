#Hash exercise
#
puts "Welcome to DBC Interior Design!"

# Input first name as string
puts
print "Enter your first name: "
first_name = gets.chomp

# Input last name as string
puts
print "Enter your last name: "
last_name = gets.chomp

# Input age as integer
puts
print "Enter your age: "
age = gets.chomp.to_i

# Input marital status as boolean
puts
print "Are you married? (y/n) "
m_string = gets.chomp
if m_string == "y"
	married = true
else
	married = false
end

# Input number of children as integer
puts
print "How many children do you have? "
children = gets.chomp.to_i

# Input special preferences as string
puts
puts "Enter any special preferences you have (leave blank if none): "
special = gets.chomp

# Initialize has with data
client = {
	:fn=>first_name,
	:ln=>last_name,
	:age=>age,
	:married=>married,
	:children=>children,
	:special=>special
}

# Print data in hash
puts
puts "First name: #{client[:fn]}"
puts "Last name: #{client[:ln]}"
puts "Age: #{client[:age]}"
puts "Married: #{client[:married]}"
puts "Number of children: #{client[:children]}"
puts "Special preferences: #{client[:special]}"

# Allow user to enter a key to edit (as a string)
puts
print "Enter a key to edit, or 'none' if none: "
key_string = gets.chomp

# If user wants to edit a key
if key_string != "none"
	# Convert string to key
	key = key_string.to_sym
	# Get new value for key
	print "Enter new value for #{key_string}: "
	value = gets.chomp
	# Assign new value to key
	case key
	when :fn
		client[:fn] = value
	when :ln
		client[:ln] = value
	when :age
		client[:age] = value.to_i
	when :married
		if value == "true"
			client[:married] = true
		else
			client[:married] = false
		end
	when :fn
		client[:children] = value.to_i
	when :fn
		client[:special] = value
	else
		puts "I don't recognize that key!"
	end
	
end

# Print data in hash again
puts
puts "First name: #{client[:fn]}"
puts "Last name: #{client[:ln]}"
puts "Age: #{client[:age]}"
puts "Married: #{client[:married]}"
puts "Number of children: #{client[:children]}"
puts "Special preferences: #{client[:special]}"
