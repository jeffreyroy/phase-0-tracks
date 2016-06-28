# Method to create a list
# create_list(items_string)
# parameter: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # split items_string into items_array using spaces as divider
  # create empty hash items_hash
  # loop through string s in items_array
  	# add item to items_hash using s as key and 1 as quantity
  # print the list to the console [can you use one of your other methods here?]
  # print_list(items_hash)
# output: hash

def create_list(items_string)
	items_array = items_string.split(" ")
	items_hash = {}
	items_array.each do |s|
		items_hash[s] = 1
	end
	print_list(items_hash)
	return items_hash
end

# Method to add an item to a list
# add_item(items_list, item, quantity = 1)
# parameter: hash of items, item name (string) and optional quantity (integer)
# steps:
  # add new item to hash using string as key and quantity as value
# output:  updated hash

def add_item(items_list, item, quantity = 1)
	items_list[item] = quantity
	return items_list
end

# Method to remove an item from the list
# remove_item(items_list, item)
# input: hash of items, item name (string)
# steps:
  # IF key exists in hash
  	# delete item using key
  # END IF
# output: new hash

def remove_item(items_list, item)
	if items_list.key?(item)
		items_list.delete(item)
	end
	return items_list
end


# Method to update the quantity of an item
# update_quantity(items_list, item, quantity)
# input:  hash of items, item (string), quantity (integer)
# steps:
  # IF key exists in hash
    # set new quantity using string as key
  # END IF
# output: new hash

def update_quantity(items_list, item, quantity)
	if items_list.key?(item)
		items_list[item] = quantity
	end
end

# Method to print a list and make it look pretty
# print_list(items_hash)
# input:  hash of items
# steps:
  # loop through keys in hash
  	# print "I need (value) of (key)"
# output: nil

def print_list(items_hash)
	items_hash.each_key do |key|
		puts "I need #{items_hash[key]} of item #{key}. "
	end
end

# Main

# Create empty list
groceries = create_list("")

# Add items
add_item(groceries, "Lemonade", 2)
add_item(groceries, "Tomatoes", 3)
add_item(groceries, "Onions", 1)
add_item(groceries, "Ice Cream", 4)

# Make updates
remove_item(groceries, "Lemonade")
update_quantity(groceries, "Ice Cream", 1)

# Print list
print_list(groceries)

# Reflection

# 1. What did you learn about pseudocode from working on this challenge?
#
# I learned that the purpose of pseudocode is to provide an outline of steps
# that can be implemented in any language.
#
# 2. What are the tradeoffs of using arrays and hashes for this challenge?
#
# A hash was better for this challenge because it involves paired data sets
# (an item and a corresponding quantity).  Using arrays would have required two
# separate arrays for items and quantities, which would have been more complicated.
#
# 3. What does a method return?
#
# A method returns the value of the last statement executed,
# or the value specified in a 'return' statement if there is one.
#
# 4. What kind of things can you pass into methods as arguments?
#
# I believe any variables can be passed as arguments, including strings, arrays, hashes, and so on.
#
# 5. How can you pass information between methods?
#
# Usually you'd pass information using arguments.  In theory global variables could be used,
# but global variables are usually avoided in favor of local variables.
#
# 6. What concepts were solidified in this challenge, and what concepts are still confusing?
#
# I'm still confused about how specific pseduocoding needs to be.  For example, should we
# use variable names?  Can we use built-in Ruby methods?  If we can't use built-in methods
# in pseudocode, do we need to specify all the steps that would be performed by a built-in method?
