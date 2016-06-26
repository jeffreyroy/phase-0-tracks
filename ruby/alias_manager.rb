# Alias generator

## Define method to swap first and last names
def first_to_last(name)
	# convert name into array
	names = name.split(" ")
	# l is the last element of the array
	l = names.length - 1
	# swap first and last
	# temp = array[0]
	temp = names[0]
	# array[0] = array [l]
	names[0] = names[l]
	# array[l] = temp
	names[l] = temp
	# convert array back into new string
	new_name = names.join(" ")
	# return new string
	return new_name
end

## Define method to switch vowels and consonants
def next_letter(name)
	## Create master replacement list
	## We'll replace each letter with the next one in the list
	## Edge cases, upper case, etc. are handled within a single list
	# create master list of letters
	swap_list = "aeiouabcdfghjklmnpqrstvwxyzb"
	# add upper case letters
	swap_list = swap_list + swap_list.upcase
	# divide name into array of characters
	letters = name.chars
	# for each letter in array
	new_letters = letters.map do |letter|
		# find letter in master list
		i = swap_list.index(letter)
		# if found
		if i
			# switch letter with next letter in list
			swap_list[i+1]
		# else keep as is
		else
			letter
		end
	# end loop
	end
	# convert new array into string
	new_name = new_letters.join
	# return new name
	return new_name
end


## Main
puts "Welcome to the DBC alias generator."
# Get name as string
puts
print "Enter your real name: "
real_name = gets.chomp

# Call name swapping method
swapped_name = first_to_last(real_name)

# Call letter swapping method
new_name = next_letter(swapped_name)
# Print new alias
puts
puts "Your alias is: #{new_name}."