def test_block
	puts "I'm about to run a block..."
	yield(1, 2)
	puts "I'm done running the block."
end

test_block { |x, y| puts "The parameters are #{x} and #{y}. " }

# Define array and hash
test_array = ["England", "Scotland", "Wales", "Northern Ireland"]
test_hash = { :first_name => "Sherlock", :last_name => "Holmes" }

# Loop over array, printing each country
test_array.each do |country|
	puts country
end

# Create new array in uppercase
new_array = test_array.map do |country|
	country.upcase
end
p new_array

# Change test_array to lowercase
test_array.map! do |country|
	country = country.downcase
end
p test_array

# Print each name in the hash
test_hash.each do |name, string|
	puts "The key #{name} is #{string}."
end
p test_hash

# Create new array with names in hash
holmes_array = test_hash.map do |name, string|
	string
end
p holmes_array
p test_hash


num_array = [10, 3, 5, 2, 4, 7]

# Delete array elements less than 5
large_num_array = num_array.delete_if {|number| number < 5 }
p large_num_array
p num_array

num_array = [10, 3, 5, 2, 4, 7]

# Keep array elements less than 5
small_num_array = num_array.keep_if {|number| number < 5 }
p small_num_array


capital_hash = { :france => "Paris", :germany => "Bonn", :england => "London"}
# Reject capitals of length < 5
long_capital_hash = capital_hash.reject { |country, capital| capital.length < 5}
p long_capital_hash


