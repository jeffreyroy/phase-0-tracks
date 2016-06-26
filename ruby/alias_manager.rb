# Alias generator

## Pseudocode

# Define method to swap first and last names
# def first_to_last(name)
	# convert name into array
	# l is the last element of the array
	# temp = array[0]
	# array[0] = array [l]
	# array[l] = temp
	# convert array back into new string
	# return new string
# end of method

# Define method to switch individual letters
# def next_letter(name)
	# create master list of letters
	# divide name into array of characters
	# for each letter in array
		# find letter in master list
		# if found
			# switch letter with next letter in list
		# else keep as is
		# end if
	# end loop
	# convert new array into string
	# return new name
# end of method


# Define method to swap first and last names
def first_to_last(name)
	# convert name into array
	names = name.split(" ")
	# swap first and last
	l = names.length - 1
	temp = names[0]
	names[0] = names[l]
	names[l] = temp
	# convert array back into new string
	new_name = names.join(" ")
	return new_name
end

# Define method to switch vowels and consonants
def next_letter(name)
	# Create master replacement list
	# We'll replace each letter with the next one in the list
	# Edge cases, upper case, etc. are handled within a single list
	swap_list = "aeiouabcdfghjklmnpqrstvwxyzb"
	# add upper case letters
	swap_list = swap_list + swap_list.upcase
	# divide name into array of characters
	letters = name.chars
	# swap each letter in array
	new_letters = letters.map do |letter|
		i = swap_list.index(letter)
		if i
			# switch letter with next letter in list
			swap_list[i+1]
		else
			# keep as is
			letter
		end
	end
	# convert new array into string
	new_name = new_letters.join
	return new_name
end


## Main
puts "Welcome to the DBC alias generator."

alias_list = []

# Allow user to enter names to convert
real_name = ""
while real_name != "quit"
	# Get name as string
	puts
	print "Enter an agent's name, or 'quit' to quit: "
	real_name = gets.chomp
	# Check whether user entered a non-blank name
	if real_name == "quit"
		puts "Thank you."
	elsif real_name.length > 0
		# Call name swapping method
		swapped_name = first_to_last(real_name)

		# Call letter swapping method
		new_name = next_letter(swapped_name)
		# Print new alias
		puts
		puts "The alias is: #{new_name}."
		# Add name and alias to the master list
		alias_hash = {
			:name => real_name,
			:fake => new_name
		}
		alias_list << alias_hash
	else
		puts "Huh?  I didn't quit catch that."
	end
end

# Print out a list of generated aliases
puts
puts "Following is a list of aliases for all agents:"
puts 
alias_list.each do |agent|
	puts "Agent #{agent[:name]} is also known as #{agent[:fake]}."
end
puts
puts "Thanks for using the DBC alias generator.  Have a great day!"